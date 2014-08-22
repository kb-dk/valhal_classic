@queue = :letter_volume_splitter

class LetterVolumeSplitter

  # Given a reference to a work
  # and a docx derived xml file, create a Work object
  # for each letter with metadata parsed from
  # the result of the xml transform
  def self.perform(work_pid, xml_pid)
    master_work = Work.find(work_pid)
    xml = BasicFile.find(xml_pid)

    raise "Work with pid #{work_pid} not found!" unless master_work
    raise "BasicFile with pid #{xml_pid} not found!" unless xml

    # Get BasicFile content as file,
    transformed = self.transform(xml.content.content)
    divs = transformed.css('text body div')

    prev_letter = nil
    divs.each do |div|
      # create a new letter work with the metadata
      data = self.parse_data(div)
      letter = Work.new(workType: 'Letter')
      letter.note = [data[:note]] if data[:note]
      letter.dateCreated = data[:date] if data[:date]
      letter.identifier= [{'displayLabel' => 'teiRef', 'value' => data[:id]}] if data[:id]
      master_work.add_part(letter)
      letter.add_previous(prev_letter) unless prev_letter.nil?
      prev_letter = letter
    end


  end

  # Given a File object representing
  # a TEI XML, perform an XSLT
  # transform on it.
  # @param File
  def self.transform(file)
    doc = Nokogiri::XML(file)
    xslt = File.read(Rails.root.join('xslt', 'docx2tei.xsl').to_s)
    xslt = Nokogiri::XSLT(xslt)
    xslt.transform(doc)
  end

  # Given a Nokogiri::XML::Element
  # representing a single div
  # return a hash of metadata parsed from this element
  # @param Nokogiri::XML::Element
  # @return Hash
  def self.parse_data(div)
    data = Hash.new
    letter = LetterData.new(div)
    data[:id] = letter.id
    data[:num] = letter.num
    data[:date] = letter.date
    data[:body] = letter.body
    data[:sender_name] = letter.sender_name
    data[:recipient_name] = letter.recipient_name
    data[:sender_address] = letter.sender_address
    data[:needs_attention] = letter.needs_attention?
    data[:note] = letter.note

    data
  end
end

# Helper class to wrap some of the parsing logic
class LetterData

  # @param Nokogiri::XML::Document div
  def initialize(div)
    @div = div
  end

  def id
    @div.attributes['id'].value
  end

  def num
    @div['n']
  end

  def date
    @div.css('date').first.text if @div.css('date').length > 0
  end

  def body
    @div.text
  end

  def note
    if @div.css('note').length > 0
      val = @div.css('note').first.text
      {displayLabel: 'noteFromText', value: val}
    end
  end

  def sender_name
    @div.css('persName[type="sender"]').first.text if @div.css('persName[type="sender"]').length > 0
  end

  def recipient_name
    @div.css('address name').first.text if @div.css('address name').length > 0
  end

  def sender_address
    @div.css('placeName[type="sender"]').first.text if @div.css('placeName[type="sender"]').length > 0
  end

  # If we have duplicate date or recipient fields we
  # are likely to have two letters within the same div
  # therefore we flag for manual attention
  def needs_attention?
    @div.css('date').size > 1 || @div.css('address name').size > 1
  end


end