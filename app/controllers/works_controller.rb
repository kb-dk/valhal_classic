# -*- encoding : utf-8 -*-
class WorksController < ApplicationController
  include WorkHelper # methods: add_single_file_ins, set_authors, set_concerned_people
  include AdministrationHelper # methods: update_administrative_metadata_from_controller
  include PreservationHelper # methods: update_preservation_profile_from_controller
  include DisseminationService # methods: ??

  authorize_resource
  before_action :set_work, only: [:show, :show_agent, :show_metadata, :show_file, :edit, :preservation,
                                  :dissemination, :update_agent, :update_metadata, :update_file, :save_edit,
                                  :destroy, :update_preservation_profile, :send_to_dissemination,
                                  :finish_work_with_structmap, :show_mods ]

  def index
    @works = Work.all
  end

  def show
  end

  def show_agent
  end

  def show_metadata
  end

  def show_file
  end

  def new
    @work = Work.new
  end

  def new_from_mods
    @work = Work.new
  end

  def edit
  end

  def preservation
  end

  def dissemination
  end

  # Retrieves the work for the administration view
  def administration
    @work = Work.find(params[:id])
  end

  def create
    #Validation passed begin processing parameters
    @work = Work.new(params[:work])

    if invalid_arguments?(params)
      logger.debug "#{@work.errors.size.to_s} Validation errors found, returning to form"
      render action: 'new'
      return
    end

    update_administrative_metadata_from_controller(params, @work, true)

    if @work.save
      redirect_to show_agent_work_path @work
    else
      render action: 'new'
    end
  end

  def create_from_mods
    @work = Work.new
    begin
      mods = params[:work][:mods_file]
      mods_file = Nokogiri::XML::Document.parse(File.read(mods.tempfile))

      basic_files = []

      params[:work][:basic_files].each do |f|
        bf = BasicFile.new
        unless bf.add_file(f, params[:work][:skip_fits])
          return false
        end
        bf.save!

        basic_files << bf
      end

      logger.debug "Creating from MODS: #{mods}"
      logger.debug "Creating with files: #{basic_files}"

      @work, instance = TransformationService.create_from_mods(mods_file, basic_files)
      logger.info "Created work: #{@work.inspect}"
      logger.info "Created instance: #{instance}"
      redirect_to @work
    rescue => error
      error_msg = error.to_s
      error.backtrace.each do |l|
        error_msg += "\n#{l}"
      end
      logger.error error_msg

      @work.errors[:error] = error_msg
      @work.errors[:params] = params.inspect
      render action: 'new_from_mods'
    end
  end

  def update_agent
    handle_arguments
    if @work.save
      redirect_to show_metadata_work_path @work
    else
      render action "update_agent"
    end
  end

  def update_metadata
    if @work.update_attributes(params[:work])
      redirect_to show_file_work_path @work
    else
      render action: "show_metadata"
    end
  end

  def update_file
    handle_arguments

    if !params[:multiple_files].blank? && !params[:multiple_files][:basic_files].blank?
      logger.debug 'Allowing user to order files...'
      render action: 'sort_multiple_files'
    else
      redirect_to @work, notice: 'Work was successfully created.'
    end
  end

  def save_edit
    @work = Work.find(params[:id])
    handle_arguments
    work_params = params[:work]
    work_params.delete :agents if work_params.include? :agents
    if @work.update_attributes(work_params)
      handle_arguments
      redirect_to show_file_work_path @work
    else
      render action: "edit"
    end
  end

  def file_edit
    if @work.update_attributes(params[:work])
      handle_arguments
    else
      render action: "edit"
    end
  end

  def destroy
    @work.destroy

    redirect_to works_url
  end

  # Updates the preservation profile metadata.
  def update_preservation_profile
    begin
      notice = update_preservation_profile_from_controller(params, @work)
      redirect_to @work, notice: notice
    rescue => error
      error_msg = "Could not update preservation profile: #{error.inspect}"
      error.backtrace.each do |l|
        error_msg += "\n#{l}"
      end
      logger.error error_msg
      @work.errors[:preservation] << error.inspect.to_s
      render action: 'preservation'
    end
  end

  # Updates the dissemination and performs the
  def send_to_dissemination
    begin
      # Using Nokogiri to locate DOOMSDAY DEVICE!!!
      url = Nokogiri::XML(@work.descMetadata.to_xml).css("url").last.content()
      disseminate(@work, {'fileUri' => url}, DisseminationService::DISSEMINATION_TYPE_BIFROST_BOOKS)
      redirect_to @work, notice: "Sent to BifrostBooks"
    rescue NoMethodError => e
      @work.errors[:Metadata] << ": The metadata does not contain an URL for the pdf."
      render action: 'dissemination'
    rescue => e
      @work.errors[:dissemination] << "Error while trying to disseminate #{e.inspect}"
      render action: 'dissemination'
    end
  end

  # Updates the administration metadata for the work.
   def update_administration
    @work = Work.find(params[:id])
    begin
      update_administrative_metadata_from_controller(params, @work, false)
      redirect_to @work, notice: 'Updated the administrative metadata'
    rescue => error
      error_msg = "Could not update administrative metadata: #{error.inspect}"
      error.backtrace.each do |l|
        error_msg += "\n#{l}"
      end
      logger.error error_msg
      @work.errors[:administrative_metadata] << error.inspect.to_s
      render action: 'administration'
    end
  end

  def finish_work_with_structmap
    create_structmap_for_instance(params[:structmap_file_order], @work.ordered_instances.last)
    redirect_to @work, notice: 'Work was successfully created.'
  end

  def show_mods
    begin
      mods = TransformationService.transform_to_mods(@work)
      errors = TransformationService.validate_mods(mods)
      if errors.empty?
        logger.info "Sending valid MODS record for Work: {ID: #{@work.id}, UUID: #{@work.uuid}}"
        # TODO: Figure out whether the official mime-type for MODS really is 'application/xml+mods' instead.
        send_data mods, {:filename => "#{@work.uuid}-mods.xml", :type => 'text/xml'}
      else
        logger.warn "Issue when transforming to MODS for Work: {ID: #{@work.id}, UUID: #{@work.uuid}}:\n #{errors}"
        redirect_to @work, notice: "Could not transform into valid MODS (version 3.5): #{errors}"
      end
    rescue ActiveFedora::ObjectNotFoundError => obj_not_found
      flash[:error] = 'The file you requested could not be found in Valhal! Please contact your system administrator'
      logger.error obj_not_found.to_s
      redirect_to @work
    rescue StandardError => standard_error
      flash[:error] = 'An error has occurred. Please contact your system administrator'
      logger.error standard_error.to_s
      redirect_to :root
    end
  end

  #Ajax GET request to return appropriate material types for the chosen material group
  def get_admin_material_types
    material_types = get_material_types
    respond_to do |format|
      format.json { render json: material_types}
    end
  end

  private
  # Handles the parameter arguments
  # If single basic_files is given, then a SingeFileInstance is made from it.
  # If multiple basic_files is given, then a OrderedInstance is made from it.
  #
  def handle_arguments
    if !params[:single_file].blank? && !params[:single_file][:basic_files].blank?
      logger.debug 'Creating a instance'
      add_single_file_ins(params[:single_file][:basic_files], params[:ins], params[:skip_file_characterisation], @work)
    end

    # add the agents and their relationships to the work
    if !params[:work_agents].blank?
      add_agents(JSON.parse(params[:work_agents]), @work)
    end

    #Create ordered instance
    if !params[:multiple_files].blank? && !params[:multiple_files][:basic_files].blank?
      logger.debug 'Creating an ordered instance'
      add_ordered_file_ins(params[:multiple_files][:basic_files], params[:ins], params[:skip_file_characterisation], @work)
    end

  end

  def invalid_arguments?(params)
    #Validate form params
    logger.debug 'Validating parameters...'
    if params.empty? || params[:work].empty?
      @work.errors.add(:metadata, 'The work cannot exist without metadata.')
    end

    logger.debug 'Validation finished'
    @work.errors.size > 0
  end

  def set_work
    @work = Work.find(params[:id])
  end
end
