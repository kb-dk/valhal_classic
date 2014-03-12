# -*- encoding : utf-8 -*-
module DigitisationHelper

  #Subscribe to the DOD Digitisation Workflow queue
  #@param channel The channel to the message broker.
  def subscribe_to_dod_digitisation(channel)
    if MQ_CONFIG["digitisation"]["source"].blank?
      logger.warn 'No preservation response queue defined -> Not listening'
      return
    end

    source = MQ_CONFIG["digitisation"]["source"]
    q = channel.queue(source, :durable => true)
    logger.info "Listening to DOD digitisation workflow queue: #{source}"

    q.subscribe do |delivery_info, metadata, payload|
      begin
        logger.debug "Received the following DOD eBook message: #{payload}"
        handle_digitisation_dod_ebook(JSON.parse(payload))
      rescue => e
        logger.error "Tried to handle DOD eBook message: #{payload}\nCaught error: #{e}"
      end
    end
  end

  def create_dod_work(message)
    logger.debug 'Going to generate MODS for eBook...'
    aleph_set_number = get_aleph_set_number(message['id'])
    aleph_marc_xml = get_aleph_marc_xml(aleph_set_number)
    mods = transform_aleph_marc_xml_to_mods(aleph_marc_xml)

    puts "mods = #{mods}"

  end

  def get_aleph_set_number(barcode)
    logger.debug "Looking up aleph set number using barcode: #{barcode}"
    #make http request for set number
    aleph_base_uri = 'http://aleph-00.kb.dk/X'
    #parse XML result to get set_number
    http_service = HttpService.new
    aleph_set_number_xml = http_service.do_post(aleph_base_uri, params = {
                                                    "op" => "find",
                                                    "base" => "kgl01",
                                                    "library" => "kgl01",
                                                    "request" => "bar=#{barcode}"})
    logger.debug aleph_set_number_xml
    puts aleph_set_number_xml

    #get the set number out of XML
    aleph_set_number = Nokogiri::XML.parse(aleph_set_number_xml).xpath('/find/set_number/text()').to_s

    puts "aleph_set_number = #{aleph_set_number}"
    logger.debug "aleph_set_number = #{aleph_set_number}"

    aleph_set_number
  end

  def get_aleph_marc_xml(aleph_set_number)
    logger.debug "Looking up aleph marc xml using set_number: #{aleph_set_number}"

    aleph_base_uri = 'http://aleph-00.kb.dk/X'
    http_service = HttpService.new
    aleph_marc_xml = http_service.do_post(aleph_base_uri, params = {"op" => "present",
                                                                    "set_no" => "#{aleph_set_number}",
                                                                    "set_entry" => "000000001",
                                                                    "format" => "marc"})
    puts "#{aleph_marc_xml}"
    aleph_marc_xml
  end

  def transform_aleph_marc_xml_to_mods(aleph_marc_xml)
    logger.debug 'Running XSLT transformation of Aleph MARC XML to MODS...'
    doc = Nokogiri::XML.parse(aleph_marc_xml)
    xslt1 = Nokogiri::XSLT(File.read("#{Rails.root}/xslt/dummy1.xsl"))
    tmp_doc = xslt1.transform(doc)
    xslt2 = Nokogiri::XSLT(File.read("#{Rails.root}/xslt/dummy2.xsl"))
    mods = xslt2.transform(tmp_doc)
    return Nokogiri::XML.parse(File.read("#{Rails.root}/spec/fixtures/mods_digitized_book.xml"))
  end

end