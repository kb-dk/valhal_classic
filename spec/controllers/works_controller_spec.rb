# -*- encoding : utf-8 -*-
require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WorksController do
  #Login a test user with admin rights
  before(:each) do
    login_admin
  end

  # This should return the minimal set of attributes required to create a valid
  # Work. As you add validations to Work, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { :title => 'TestTitle', :workType => 'TestWorkType', :subTitle => Time.now.nsec.to_s }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WorksController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe 'GET index' do
    before :each do
      Work.all.each { |w| w.destroy }
    end
    it 'assigns all works as @works' do
      work = Work.create! valid_attributes
      get :index, {}, valid_session
      assigns(:works).should eq([work])
    end
  end

  describe 'GET show' do
    it 'assigns the requested work as @work' do
      work = Work.create! valid_attributes
      get :show, {:id => work.to_param}, valid_session
      assigns(:work).should eq(work)
    end
  end

  describe 'GET new' do
    it 'assigns a new work as @work' do
      get :new, {}, valid_session
      assigns(:work).should be_a_new(Work)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested work as @work' do
      work = Work.create! valid_attributes
      get :edit, {:id => work.to_param}, valid_session
      assigns(:work).should eq(work)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Work' do
        expect {
          post :create, {:work => valid_attributes}, valid_session
        }.to change(Work, :count).by(1)
      end

      it 'assigns a newly created work as @work' do
        post :create, {:work => valid_attributes}, valid_session
        assigns(:work).should be_a(Work)
        assigns(:work).should be_persisted
      end

      it 'redirects to the created work' do
        pending 'Failing unit-test'
        post :create, {:work => valid_attributes}, valid_session
        response.should redirect_to(Work.all.last)
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved work as @work' do
        # Trigger the behavior that occurs when invalid params are submitted
        Work.any_instance.stub(:save).and_return(false)
        post :create, {:work => {  }}, valid_session
        assigns(:work).should be_a_new(Work)
      end

      it 're-renders the \'new\' template' do
        post :create, {:work => {  }}, valid_session
        response.should render_template('new')
      end
    end

    describe 'with a single basic_files parameter' do
      it 'should use create a SingleFileInstance with the basic_files' do
        pending 'Failing unit-test'
        post :create, {:work => valid_attributes, :single_file => {'basic_files' => ActionDispatch::Http::UploadedFile.new(filename: 'aarrebo_tei_p5_sample.xml', type: 'text/xml', tempfile: File.new("#{Rails.root}/spec/fixtures/aarrebo_tei_p5_sample.xml")) }}, valid_session
        response.should redirect_to(Work.all.last)
        Work.all.last.instances.length.should == 1
        Work.all.last.instances.last.kind_of?(SingleFileInstance).should be_true
        Work.all.last.instances.last.files.length.should == 1
        Work.all.last.instances.last.files.last.kind_of?(BasicFile).should be_true
      end
    end

    describe 'duplicate' do
      before(:all) do
        @work = Work.create(valid_attributes)
      end
      it 'should redirect to \'new\' when duplicate work' do
        post :create, {:work => {:title => @work.title, :workType => @work.workType, :subTitle => @work.subTitle}}, valid_session
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested work' do
        pending 'Failing unit-test'
        work = Work.create! valid_attributes
        # Assuming there are no other works in the database, this
        # specifies that the Work created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Work.any_instance.should_receive(:update_attributes).with({ 'these' => 'params' })
        put :update, {:id => work.to_param, :work => { 'these' => 'params' }}, valid_session
      end

      it 'assigns the requested work as @work' do
        pending 'Failing unit-test'
        work = Work.create! valid_attributes
        put :update, {:id => work.to_param, :work => valid_attributes}, valid_session
        assigns(:work).should eq(work)
      end

      it 'redirects to the work' do
        pending 'Failing unit-test'
        work = Work.create! valid_attributes
        put :update, {:id => work.to_param, :work => valid_attributes}, valid_session
        response.should redirect_to(work)
      end
    end

    describe 'with invalid params' do
      it 'assigns the work as @work' do
        pending 'Failing unit-test'
        work = Work.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Work.any_instance.stub(:save).and_return(false)
        put :update, {:id => work.to_param, :work => {  }}, valid_session
        assigns(:work).should eq(work)
      end

      it 're-renders the \'edit\' template' do
        pending 'Failing unit-test'
        work = Work.create! valid_attributes
        put :update, {:id => work.to_param, :work => {  }}, valid_session
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested work' do
      work = Work.create! valid_attributes
      expect {
        delete :destroy, {:id => work.to_param}, valid_session
      }.to change(Work, :count).by(-1)
    end

    it 'redirects to the works list' do
      work = Work.create! valid_attributes
      delete :destroy, {:id => work.to_param}, valid_session
      response.should redirect_to(works_url)
    end
  end

  describe 'Update preservation profile metadata' do
    before(:each) do
      @work = Work.create! valid_attributes
    end
    it 'should have a default preservation settings' do
      work = Work.find(@work.pid)
      work.preservation_profile.should_not be_blank
      work.preservation_state.should_not be_blank
      work.preservation_details.should_not be_blank
      work.preservation_modify_date.should_not be_blank
      work.preservation_comment.should be_blank
    end

    it 'should be updated and redirect to the work' do
      profile = PRESERVATION_CONFIG["preservation_profile"].keys.last
      comment = "This is the preservation comment"

      put :update_preservation_profile, {:id => @work.pid, :preservation => {:preservation_profile => profile, :preservation_comment => comment }}
      response.should redirect_to(@work)

      work = Work.find(@work.pid)
      work.preservation_state.should_not be_blank
      work.preservation_details.should_not be_blank
      work.preservation_modify_date.should_not be_blank
      work.preservation_profile.should == profile
      work.preservation_comment.should == comment
    end

    it 'should not update or redirect, when the profile is wrong.' do
      profile = "wrong profile #{Time.now.to_s}"
      comment = "This is the preservation comment"

      put :update_preservation_profile, {:id => @work.pid, :preservation => {:preservation_profile => profile, :preservation_comment => comment }}
      response.should_not redirect_to(@work)

      work = Work.find(@work.pid)
      work.preservation_state.should_not be_blank
      work.preservation_details.should_not be_blank
      work.preservation_modify_date.should_not be_blank
      work.preservation_profile.should_not == profile
      work.preservation_comment.should_not == comment
    end

    it 'should update the preservation date' do
      profile = PRESERVATION_CONFIG["preservation_profile"].keys.last
      comment = "This is the preservation comment"
      work = Work.find(@work.pid)
      d = work.preservation_modify_date

      put :update_preservation_profile, {:id => @work.pid, :preservation => {:preservation_profile => profile, :preservation_comment => comment }}
      response.should redirect_to(@work)

      work = Work.find(@work.pid)
      work.preservation_modify_date.should_not == d
    end

    it 'should not update the preservation date, when the same profile and comment is given.' do
      profile = PRESERVATION_CONFIG["preservation_profile"].keys.last
      comment = "This is the preservation comment"
      @work.preservation_profile = profile
      @work.preservation_comment = comment
      @work.save

      work = Work.find(@work.pid)
      d = work.preservation_modify_date

      put :update_preservation_profile, {:id => @work.pid, :preservation => {:preservation_profile => profile, :preservation_comment => comment }}
      response.should redirect_to(@work)

      work = Work.find(@work.pid)
      work.preservation_modify_date.should == d
    end

    it 'should send a message, when performing preservation and the profile has Yggdrasil set to true' do
      profile = PRESERVATION_CONFIG["preservation_profile"].keys.last
      PRESERVATION_CONFIG['preservation_profile'][profile]['yggdrasil'].should == 'true'
      comment = "This is the preservation comment"
      destination = MQ_CONFIG["preservation"]["destination"]
      uri = MQ_CONFIG["mq_uri"]

      conn = Bunny.new(uri)
      conn.start

      ch = conn.create_channel
      q = ch.queue(destination, :durable => true)

      put :update_preservation_profile, {:id => @work.pid, :commit => Constants::PERFORM_PRESERVATION_BUTTON, :preservation => {:preservation_profile => profile, :preservation_comment => comment }}
      response.should redirect_to(@work)

      q.subscribe do |delivery_info, metadata, payload|
        metadata[:type].should == Constants::MQ_MESSAGE_TYPE_PRESERVATION_REQUEST
        payload.should include @work.pid
        json = JSON.parse(payload)
        json.keys.should include ('UUID')
        json.keys.should include ('Preservation_profile')
        json.keys.should include ('Valhal_ID')
        json.keys.should_not include ('File_UUID')
        json.keys.should_not include ('Content_URI')
        json.keys.should include ('Model')
        json.keys.should include ('metadata')
        json['metadata'].keys.each do |k|
          @work.datastreams.keys.should include k
          Constants::NON_RETRIEVABLE_DATASTREAM_NAMES.should_not include k
        end
      end

      work = Work.find(@work.pid)
      work.preservation_state.should == Constants::PRESERVATION_STATE_INITIATED.keys.first
      work.preservation_comment.should == comment
      sleep 1.second
      conn.close
    end

    it 'should not send a message, when performing preservation and the profile has Yggdrasil set to false' do
      profile = PRESERVATION_CONFIG['preservation_profile'].keys.first
      PRESERVATION_CONFIG['preservation_profile'][profile]['yggdrasil'].should == 'false'
      comment = 'This is the preservation comment'

      put :update_preservation_profile, {:id => @work.pid, :commit => Constants::PERFORM_PRESERVATION_BUTTON,
                                         :preservation => {:preservation_profile => profile,
                                                           :preservation_comment => comment }}
      response.should redirect_to(@work)

      work = Work.find(@work.pid)
      work.preservation_state.should == Constants::PRESERVATION_STATE_NOT_LONGTERM.keys.first
      work.preservation_comment.should == comment
    end

    it 'should send inheritable settings to instances and their files' do
      file = create_basic_file(nil)
      ins = SingleFileInstance.new
      ins.files << file
      ins.ie = @work
      @work.instances << ins
      ins.save!
      file.save!
      @work.save!

      profile = PRESERVATION_CONFIG["preservation_profile"].keys.last
      comment = "This is the preservation comment-#{Time.now.to_s}"

      put :update_preservation_profile, {:id => @work.pid, :commit => Constants::PERFORM_PRESERVATION_BUTTON, :preservation =>
          {:preservation_profile => profile, :preservation_comment => comment, :preservation_inheritance => '1'}}

      bf = BasicFile.find(file.pid)
      bf.preservation_state.should_not be_blank
      bf.preservation_details.should_not be_blank
      bf.preservation_modify_date.should_not be_blank
      bf.preservation_profile.should == profile
      bf.preservation_comment.should == comment

      ins = SingleFileInstance.find(ins.pid)
      ins.preservation_state.should_not be_blank
      ins.preservation_details.should_not be_blank
      ins.preservation_modify_date.should_not be_blank
      ins.preservation_profile.should == profile
      ins.preservation_comment.should == comment

      w = Work.find(@work.pid)
      w.preservation_state.should_not be_blank
      w.preservation_details.should_not be_blank
      w.preservation_modify_date.should_not be_blank
      w.preservation_profile.should == profile
      w.preservation_comment.should == comment
    end
  end

  describe 'GET preservation' do
    it 'should assign \'@work\' to the work' do
      @work = Work.create! valid_attributes
      get :preservation, {:id => @work.pid}
      assigns(:work).should eq(@work)
    end
  end

  describe 'PATCH send to dissemination' do
    it 'should redirect to it self' do
      pending "NOT IMPLEMENTED!"
      @work = Work.create! valid_attributes
      put :send_to_dissemination, {:id => @work.pid}
      response.should redirect_to(@work)
    end
  end

  describe 'GET dissemination' do
    it 'should assign \'@work\' to the work' do
      @work = Work.create! valid_attributes
      get :dissemination, {:id => @work.pid}
      assigns(:work).should eq(@work)
    end
  end

  after(:all) do
    Work.all.each {|p| p.delete}
  end
end
