# -*- encoding : utf-8 -*-
require 'spec_helper'
include ManifestationsHelper

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

describe BooksController do
  #Login a test user with admin rights
  before(:each) do
    login_admin
  end

  # This should return the minimal set of attributes required to create a valid
  # Book. As you add validations to Book, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { :genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504073',
      :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
      :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
      :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
      :subjectTopic => 'N8217.H68', :physicalExtent => '510'}
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BooksController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe 'GET index' do
    it 'assigns all books as @books' do
      book = Book.create!(:genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504073',
                          :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                          :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                          :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                          :subjectTopic => 'N8217.H68', :physicalExtent => '510')
      get :index, {}, valid_session
      assigns(:books).should include book
    end
  end

  describe 'GET show' do
    it 'assigns the requested book as @book' do
      book = Book.create!(:genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504074',
                          :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                          :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                          :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                          :subjectTopic => 'N8217.H68', :physicalExtent => '510')
      get :show, {:id => book.to_param}, valid_session
      assigns(:book).should eq(book)
    end
  end

  describe 'GET new' do
    it 'assigns a new book as @book' do
      get :new, {}, valid_session
      assigns(:book).should be_a_new(Book)
    end
  end

  describe 'GET edit' do
    it 'assigns the requested book as @book' do
      book = Book.create!(:genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504075',
                          :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                          :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                          :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                          :subjectTopic => 'N8217.H68', :physicalExtent => '510')
      get :edit, {:id => book.to_param}, valid_session
      assigns(:book).should eq(book)
    end
  end

  describe 'POST create' do
    describe 'with valid params' do
      it 'creates a new Book' do
        attributes = { :genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '7787504073',
                       :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                       :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                       :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                       :subjectTopic => 'N8217.H68', :physicalExtent => '510'}
        expect {
          post :create, {:book => attributes}, valid_session
        }.to change(Book, :count).by(1)
      end

      it 'assigns a newly created book as @book' do
        attributes = { :genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '7747504073',
                       :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                       :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                       :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                       :subjectTopic => 'N8217.H68', :physicalExtent => '510'}
        post :create, {:book => attributes}, valid_session
        assigns(:book).should be_a(Book)
        assigns(:book).should be_persisted
      end

      it 'redirects to the created book' do
        pending 'Failing unit-test'
        attributes = { :genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '4787504073',
                       :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                       :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                       :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                       :subjectTopic => 'N8217.H68', :physicalExtent => '510'}
        post :create, {:book => attributes}, valid_session
        response.should redirect_to(Book.all.last)
      end

      describe 'with a Tei representation' do
        let(:representation) { SingleFileRepresentation }

        before :all do
          @book_attributes = { :title => 'Samlede Skrifter'}
          @tei_file_attributes = { :tei_file => ActionDispatch::Http::UploadedFile.new(filename: 'aarrebo_tei_p5_sample.xml', type: 'text/xml', tempfile:
              File.new("#{Rails.root}/spec/fixtures/aarrebo_tei_p5_sample.xml"))}
        end
        it 'should create the book' do
          expect {
            post :create, {:book => @book_attributes , :basic_files => @tei_file_attributes }, valid_session
          }.to change(Book, :count).by(1)
        end
        it 'should create a Tei representation' do
          pending 'Failing unit-test'
          expect {
            post :create, {:book => @book_attributes , :basic_files => @tei_file_attributes }, valid_session
          }.to change(representation, :count).by(1)
        end
        it 'should not create a tiff representation' do
          expect {
            post :create, {:book => @book_attributes , :basic_files => @file_attributes }, valid_session
          }.not_to change(representation, :count)
        end
        it 'should create a basic basic_files' do
          pending 'Failing unit-test'
          expect {
            post :create, {:book => @book_attributes , :basic_files => @tei_file_attributes }, valid_session
          }.to change(TeiFile, :count).by(1)
        end
        it 'should not create a tifffile' do
          expect {
            post :create, {:book => @book_attributes , :basic_files => @tei_file_attributes }, valid_session
          }.not_to change(TiffFile, :count)
        end
        it 'should create a relation between book and tei-representation' do
          pending 'Failing unit-test'
          post :create, {:book => @book_attributes , :basic_files => @tei_file_attributes }, valid_session
          Book.all.last.has_rep?.should be_true
          representation.all.last.has_ie?.should be_true
          Book.all.last.single_file_reps.length.should == 1
          Book.all.last.single_file_reps.first.should == representation.all.last
          representation.all.last.ie.should == Book.all.last
        end
        it 'should create a relation between tei-representation and basic-basic_files' do
          pending 'Failing unit-test'
          post :create, {:book => @book_attributes , :basic_files => @tei_file_attributes }, valid_session
          representation.all.last.files.length.should == 1
          representation.all.last.files.first.should == TeiFile.all.last
        end
        it 'should create a metadata for tei-representation' do
          pending 'Failing unit-test'
          post :create, {:book => @book_attributes , :basic_files => @tei_file_attributes, :representation_metadata => {:label => 'The label'}}, valid_session
          representation.all.last.files.length.should == 1
          representation.all.last.files.first.should == TeiFile.all.last
          representation.all.last.label.should == 'The label'
        end
      end

      describe 'with a Tiff representation but without a structmap' do
        let(:representation) { OrderedRepresentation }
        before :all do
          @book_attributes = { :title => 'Samlede Skrifter'}
          @tiff_file_attributes = { :tiff_file => [ActionDispatch::Http::UploadedFile.new(filename: 'test.tiff', type: 'image/tiff',
                                                                                          tempfile: File.new("#{Rails.root}/spec/fixtures/arre1fm001.tif"), head: 'Content-Disposition: form-data; name=\'basic_files[tiff_file][]\'; filename=\'arre1fm005.tif\'\r\nContent-Type: image/tiff\r\n')]}
        end
        it 'should create the book' do
          expect {
            post :create, {:book => @book_attributes , :basic_files => @tiff_file_attributes }, valid_session
          }.to change(Book, :count).by(1)
        end
        it 'should create a Tiff representation' do
          pending 'Failing unit-test'
          expect {
            post :create, {:book => @book_attributes , :basic_files => @tiff_file_attributes }, valid_session
          }.to change(representation, :count).by(1)
        end
        it 'should not create a tei representation' do
          expect {
            post :create, {:book => @book_attributes , :basic_files => @file_attributes }, valid_session
          }.not_to change(representation, :count)
        end
        it 'should create a tiff basic_files' do
          pending 'Failing unit-test'
          expect {
            post :create, {:book => @book_attributes , :basic_files => @tiff_file_attributes }, valid_session
          }.to change(TiffFile, :count).by(1)
        end
        it 'should not create a basic basic_files for the struct map' do
          expect {
            post :create, {:book => @book_attributes , :basic_files => @file_attributes }, valid_session
          }.not_to change(BasicFile, :count)
        end
        it 'should create a relation between book and tiff-representation' do
          pending 'Failing unit-test'
          post :create, {:book => @book_attributes , :basic_files => @tiff_file_attributes }, valid_session
          Book.all.last.has_rep?.should be_true
          representation.all.last.has_ie?.should be_true
          Book.all.last.ordered_reps.length.should == 1
          Book.all.last.ordered_reps.first.should == representation.all.last
          representation.all.last.ie.should == Book.all.last
        end
        it 'should create a relation between tiff-representation and basic-basic_files' do
          pending 'Failing unit-test'
          post :create, {:book => @book_attributes , :basic_files => @tiff_file_attributes }, valid_session
          representation.all.last.files.length.should == 1
          representation.all.last.files.first.should == TiffFile.all.last
        end

        it 'should create a relation between tiff-representation and basic-basic_files' do
          pending 'Failing unit-test'
          post :create, {:book => @book_attributes , :basic_files => @tiff_file_attributes }, valid_session
          representation.all.last.files.length.should == 1
          representation.all.last.files.first.should == TiffFile.all.last
        end
      end

      describe 'with a Tiff representation' do
        let(:representation) { OrderedRepresentation }

        before :all do
          @book_attributes = { :title => 'Samlede Skrifter'}
          @file_attributes = { :tiff_file => [ActionDispatch::Http::UploadedFile.new(filename: 'test.tiff', type: 'image/tiff',
                                                                                     tempfile: File.new("#{Rails.root}/spec/fixtures/arre1fm001.tif"),
                                                                                     head: 'Content-Disposition: form-data; name=\'basic_files[tiff_file][]\'; filename=\'arre1fm005.tif\'\r\nContent-Type: image/tiff\r\n')]}
        end
        it 'should create the book' do
          expect {
            post :create, {:book => @book_attributes , :basic_files => @file_attributes }, valid_session
          }.to change(Book, :count).by(1)
        end
        it 'should not create a tei representation' do
          pending 'Failing unit-test'
          expect {
            post :create, {:book => @book_attributes , :basic_files => @file_attributes }, valid_session
          }.not_to change(SingleFileRepresentation, :count)
        end
        it 'should create a Tiff representation' do
          pending 'Failing unit-test'
          expect {
            post :create, {:book => @book_attributes , :basic_files => @file_attributes }, valid_session
          }.to change(representation, :count).by(1)
        end
        it 'should create a tiff basic_files for the tiff representation' do
          pending 'Failing unit-test'
          expect {
            post :create, {:book => @book_attributes , :basic_files => @file_attributes }, valid_session
          }.to change(TiffFile, :count).by(1)
        end
        it 'should create a relation between book and tiff-representation' do
          pending 'Failing unit-test'
          post :create, {:book => @book_attributes , :basic_files => @file_attributes }, valid_session
          Book.all.last.has_rep?.should be_true
          representation.all.last.has_ie?.should be_true
          Book.all.last.ordered_reps.length.should == 1
          Book.all.last.ordered_reps.first.should == representation.all.last
          representation.all.last.ie.should == Book.all.last
        end

        it 'should create a relation between tiff-representation and struct-map' do
          pending 'Failing unit-test'
          post :create, {:book => @book_attributes , :basic_files => @file_attributes }, valid_session
          representation.all.last.files.length.should == 1
          representation.all.last.files.first.should == TiffFile.all.last
        end
      end

      describe 'with an author' do
        let(:representation) { OrderedRepresentation }
        before :all do
          @author = Person.create(firstname:'the firstname', lastname:'the lastname', :date_of_birth => Time.now.nsec.to_s)
          @book_attributes = { :title => 'Samlede Skrifter'}
          @person_attributes = { :id => ['', @author.id]}
        end
        it 'should create the book' do
          expect {
            post :create, {:book => @book_attributes , :person => @person_attributes }, valid_session
          }.to change(Book, :count).by(1)
        end
        it 'should not create a Tiff representation' do
          pending 'Failing unit-test'
          expect {
            post :create, {:book => @book_attributes , :person => @person_attributes }, valid_session
          }.not_to change(representation, :count)
        end
        it 'should not create a tiff basic_files for the tiff representation' do
          pending 'Failing unit-test'
          expect {
            post :create, {:book => @book_attributes , :person => @person_attributes }, valid_session
          }.not_to change(TiffFile, :count)
        end
        it 'should not create a basic basic_files' do
          pending 'Failing unit-test'
          expect {
            post :create, {:book => @book_attributes , :person => @person_attributes }, valid_session
          }.not_to change(BasicFile, :count)
        end
        it 'should have no relations to any representation' do
          pending 'Failing unit-test'
          post :create, {:book => @book_attributes , :person => @person_attributes }, valid_session
          Book.all.last.has_rep?.should be_false
        end
        it 'should create a relation between book and person' do
          pending 'Failing unit-test'
          post :create, {:book => @book_attributes , :person => @person_attributes }, valid_session
          Book.all.last.authors.length.should == 1
          Book.all.last.authors.first.should == @author
          Person.all.last.authored_books.should include(Book.all.last)
        end
      end
    end

    describe 'with invalid params' do
      it 'assigns a newly created but unsaved book as @book' do
        # Trigger the behavior that occurs when invalid params are submitted
        Book.any_instance.stub(:save).and_return(false)
        post :create, {:book => {:title => 'Samlede Skrifter', :isbn => '2227504073' }}, valid_session
        assigns(:book).should be_a_new(Book)
      end

      it 're-renders the \'new\' template' do
        # Trigger the behavior that occurs when invalid params are submitted
        Book.any_instance.stub(:save).and_return(false)
        post :create, {:book => {  }}, valid_session
        response.should render_template('new')
      end

      it 'should not allow empty set of parameters' do
        post :create, {}
        response.should render_template('new')
      end

      it 'should not allow empty set of parameters' do
        post :create, {}
        response.should render_template('new')
      end

      it 'should not allow any non-image basic_files as tiff representation' do
        pending 'Failing unit-test'
        post :create, { :book => @book_attributes, :basic_files => { :tiff_file => [ActionDispatch::Http::UploadedFile.new(filename: 'test.xml', type: 'text/xml', tempfile: File.new("#{Rails.root}/spec/fixtures/aarebo_mets_structmap_sample.xml"))]}}
        response.should render_template('new')
      end
      it 'should not allow a non-xml basic_files as tei representation' do
        pending 'Failing unit-test'
        post :create, { :book => @book_attributes, :basic_files => { :tei_file => ActionDispatch::Http::UploadedFile.new(filename: 'test.tiff', type: 'image/tiff', tempfile: File.new("#{Rails.root}/spec/fixtures/arre1fm001.tif"))}}
        response.should render_template('new')
      end
    end
  end

  describe 'PUT update' do
    describe 'with valid params' do
      it 'updates the requested book' do
        pending 'Failing unit-test'
        book = Book.create!(:genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504076',
                            :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                            :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                            :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                            :subjectTopic => 'N8217.H68', :physicalExtent => '510')
        # Assuming there are no other books in the database, this
        # specifies that the Book created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Book.any_instance.should_receive(:update_attributes).with({ 'these' => 'params' })
        put :update, {:id => book.to_param, :book => { 'these' => 'params' }}, valid_session
      end

      it 'assigns the requested book as @book' do
        pending 'Failing unit-test'
        book = Book.create!(:genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504077',
                            :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                            :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                            :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                            :subjectTopic => 'N8217.H68', :physicalExtent => '510')
        attributes = { :genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '4780004073',
                       :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                       :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                       :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                       :subjectTopic => 'N8217.H68', :physicalExtent => '510'}
        put :update, {:id => book.to_param, :book => attributes}, valid_session
        assigns(:book).should eq(book)
      end

      it 'redirects to the book' do
        pending 'Failing unit-test'
        book = Book.create!(:genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504078',
                            :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                            :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                            :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                            :subjectTopic => 'N8217.H68', :physicalExtent => '510')
        attributes = { :genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '4345504073',
                       :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                       :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                       :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                       :subjectTopic => 'N8217.H68', :physicalExtent => '510'}
        put :update, {:id => book.to_param, :book => attributes}, valid_session
        response.should redirect_to(book)
      end

      it 'should add a tiff representation of the book' do
        pending 'Failing unit-test'
        valid_params = {:title => 'title'}
        book = Book.create!(valid_params)
        book.representations.length.should == 0
        post :update, { :id => book.to_param, :book => valid_params, :basic_files => { :tiff_file => [ActionDispatch::Http::UploadedFile.new(filename: 'test.tiff', type: 'image/tiff', tempfile: File.new("#{Rails.root}/spec/fixtures/arre1fm001.tif"))]}}, valid_session
        response.should redirect_to(book)

        b = Book.find(book.pid)
        b.representations.length.should == 1
      end
    end

    describe 'with invalid params' do
      it 'assigns the book as @book' do
        pending 'Failing unit-test'
        book = Book.create!(:genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504079',
                            :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                            :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                            :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                            :subjectTopic => 'N8217.H68', :physicalExtent => '510')
        # Trigger the behavior that occurs when invalid params are submitted
        Book.any_instance.stub(:save).and_return(false)
        put :update, {:id => book.to_param, :book => {  }}, valid_session
        assigns(:book).should eq(book)
      end

      it 're-renders the \'edit\' template' do
        pending 'Failing unit-test'
        book = Book.create!(:genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504070',
                            :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                            :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                            :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                            :subjectTopic => 'N8217.H68', :physicalExtent => '510')
        # Trigger the behavior that occurs when invalid params are submitted
        Book.any_instance.stub(:save).and_return(false)
        put :update, {:id => book.to_param, :book => {  }}, valid_session
        response.should render_template('edit')
      end

      it 'should not allow a non-xml basic_files as description' do
        pending 'Failing unit-test'
        book = Book.create!(:title => 'title')
        post :update, { :id => book.to_param, :basic_files => { :tei_file => ActionDispatch::Http::UploadedFile.new(filename: 'test.tiff', type: 'image/tiff', tempfile: File.new("#{Rails.root}/spec/fixtures/arre1fm001.tif"))}}
        response.should render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'destroys the requested book' do
      book = Book.create!(:genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504071',
                          :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                          :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                          :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                          :subjectTopic => 'N8217.H68', :physicalExtent => '510')
      expect {
        delete :destroy, {:id => book.to_param}, valid_session
      }.to change(Book, :count).by(-1)
    end

    it 'redirects to the books list' do
      book = Book.create!(:genre => 'Valhal bog', :uuid => 'urn:uuid:53246d30-34b4-11e2-81c1-0800200c9a66', :isbn => '8787504072',
                          :typeOfResource =>'text', :shelfLocator => 'Pligtaflevering', :title => 'Samlede Skrifter', :subTitle => 'Bd. 1',
                          :publisher => 'Det Danske Sprog og Litteraturselskab', :originPlace => 'Copenhagen',
                          :dateIssued => '2002-10-02T10:00:00-05:00', :languageISO => 'dan', :languageText => 'DANSK',
                          :subjectTopic => 'N8217.H68', :physicalExtent => '510')
      delete :destroy, {:id => book.to_param}, valid_session
      response.should redirect_to(books_url)
    end
  end

  describe 'create structmap' do
    before(:each) do
      @book = Book.create!(:title => 'test title')
      @tiff1 = ActionDispatch::Http::UploadedFile.new(filename: 'first.tiff', type: 'image/tiff', tempfile: File.new("#{Rails.root}/spec/fixtures/arre1fm001.tif"))
      @tiff2 = ActionDispatch::Http::UploadedFile.new(filename: 'second.tiff', type: 'image/tiff', tempfile: File.new("#{Rails.root}/spec/fixtures/arre1fm001.tif"))
    end
    it 'should create a new structmap order from list of basic_files' do
      pending 'Failing unit-test'
      add_tiff_order_rep([@tiff1, @tiff2], {}, @book)

      b = Book.find(@book.pid)
      b.representations.length.should == 1
      b.representations.first.is_a?(OrderedRepresentation).should be_true
      b.representations.first.files.length.should == 2
      b.representations.first.files.first.original_filename.should == @tiff1.original_filename
      b.representations.first.files.last.original_filename.should == @tiff2.original_filename
      before_xml = b.representations.first.techMetadata.ng_xml.to_s
      before_xml.index(@tiff1.original_filename).should be < before_xml.index(@tiff2.original_filename)

      put :create_structmap, {:id => @book.pid, :structmap_file_order => @tiff2.original_filename + ',' + @tiff1.original_filename}
      response.should redirect_to(@book)

      b = Book.find(@book.pid)
      b.representations.length.should == 1
      b.representations.first.is_a?(OrderedRepresentation).should be_true
      b.representations.first.files.length.should == 2
      before_xml = b.representations.first.techMetadata.ng_xml.to_s
      before_xml.index(@tiff1.original_filename).should be > before_xml.index(@tiff2.original_filename)
    end

    it 'should not change structmap when no list of basic_files' do
      add_tiff_order_rep([@tiff1, @tiff2], {}, @book)

      b = Book.find(@book.pid)
      b.representations.length.should == 1
      b.representations.first.is_a?(OrderedRepresentation).should be_true
      b.representations.first.files.length.should == 2
      b.representations.first.files.first.original_filename.should == @tiff1.original_filename
      b.representations.first.files.last.original_filename.should == @tiff2.original_filename
      before_xml = b.representations.first.techMetadata.ng_xml.to_s
      before_xml.index(@tiff1.original_filename).should be < before_xml.index(@tiff2.original_filename)

      put :create_structmap, {:id => @book.pid}
      response.should redirect_to(@book)

      b = Book.find(@book.pid)
      b.representations.length.should == 1
      b.representations.first.is_a?(OrderedRepresentation).should be_true
      b.representations.first.files.length.should == 2
      before_xml = b.representations.first.techMetadata.ng_xml.to_s
      before_xml.index(@tiff1.original_filename).should be < before_xml.index(@tiff2.original_filename)
    end
  end

  describe 'Update preservation profile metadata' do
    before(:each) do
      @book = Book.create!(:title => 'test title')
    end
    it 'should have a default preservation settings' do
      b = Book.find(@book.pid)
      b.preservation_profile.should_not be_blank
      b.preservation_state.should_not be_blank
      b.preservation_details.should_not be_blank
      b.preservation_modify_date.should_not be_blank
      b.preservation_comment.should be_blank
    end

    it 'should be updated and redirect to the book' do
      profile = PRESERVATION_CONFIG["preservation_profile"].keys.first
      comment = "This is the preservation comment"

      put :update_preservation_profile, {:id => @book.pid, :preservation => {:preservation_profile => profile, :preservation_comment => comment }}
      response.should redirect_to(@book)

      b = Book.find(@book.pid)
      b.preservation_state.should_not be_blank
      b.preservation_details.should_not be_blank
      b.preservation_modify_date.should_not be_blank
      b.preservation_profile.should == profile
      b.preservation_comment.should == comment
    end

    it 'should not update or redirect, when the profile is wrong.' do
      profile = "wrong profile #{Time.now.to_s}"
      comment = "This is the preservation comment"

      put :update_preservation_profile, {:id => @book.pid, :preservation => {:preservation_profile => profile, :preservation_comment => comment }}
      response.should_not redirect_to(@book)

      b = Book.find(@book.pid)
      b.preservation_state.should_not be_blank
      b.preservation_details.should_not be_blank
      b.preservation_modify_date.should_not be_blank
      b.preservation_profile.should_not == profile
      b.preservation_comment.should_not == comment
    end

    it 'should update the preservation date' do
      profile = PRESERVATION_CONFIG["preservation_profile"].keys.first
      comment = "This is the preservation comment"
      b = Book.find(@book.pid)
      d = b.preservation_modify_date

      put :update_preservation_profile, {:id => @book.pid, :preservation => {:preservation_profile => profile, :preservation_comment => comment }}
      response.should redirect_to(@book)

      b = Book.find(@book.pid)
      b.preservation_modify_date.should_not == d
    end

    it 'should not update the preservation date, when the same profile and comment is given.' do
      profile = PRESERVATION_CONFIG["preservation_profile"].keys.first
      comment = "This is the preservation comment"
      @book.preservation_profile = profile
      @book.preservation_comment = comment
      @book.save

      b = Book.find(@book.pid)
      d = b.preservation_modify_date

      put :update_preservation_profile, {:id => @book.pid, :preservation => {:preservation_profile => profile, :preservation_comment => comment }}
      response.should redirect_to(@book)

      b = Book.find(@book.pid)
      b.preservation_modify_date.should == d
    end

    it 'should send a message, when performing preservation' do
      profile = PRESERVATION_CONFIG["preservation_profile"].keys.first
      comment = "This is the preservation comment"
      destination = MQ_CONFIG["preservation"]["destination"]
      uri = MQ_CONFIG["mq_uri"]

      conn = Bunny.new(uri)
      conn.start

      ch = conn.create_channel
      q = ch.queue(destination, :durable => true)

      put :update_preservation_profile, {:id => @book.pid, :commit => Constants::PERFORM_PRESERVATION_BUTTON, :preservation => {:preservation_profile => profile, :preservation_comment => comment }}
      response.should redirect_to(@book)

      q.subscribe do |delivery_info, metadata, payload|
        payload.should include @book.pid
        json = JSON.parse(payload)
        json.keys.should include ('UUID')
        json.keys.should include ('Preservation_profile')
        json.keys.should include ('Update_URI')
        json.keys.should_not include ('File_UUID')
        json.keys.should_not include ('Content_URI')
        json.keys.should include ('metadata')
        json['metadata'].keys.each do |k|
          @book.datastreams.keys.should include k
          Constants::NON_RETRIEVABLE_DATASTREAM_NAMES.should_not include k
        end
      end

      b = Book.find(@book.pid)
      b.preservation_state.should == Constants::PRESERVATION_STATE_INITIATED.keys.first
      b.preservation_comment.should == comment
      sleep 1.second
      conn.close
    end
  end

  describe 'Update preservation state metadata' do
    before(:each) do
      @book = Book.create!(:title => 'test title')
    end
    it 'should be updated and redirect to the book' do
      state = "TheNewState-#{Time.now.to_s}"
      details = "Any details will suffice."

      put :update_preservation_metadata, {:id => @book.pid, :preservation => {:preservation_state => state, :preservation_details => details }}
      response.should redirect_to(@book)

      b = Book.find(@book.pid)
      b.preservation_state.should == state
      b.preservation_details.should == details
      b.preservation_modify_date.should_not be_blank
      b.preservation_profile.should_not be_blank
    end

    it 'should change the values when updating' do
      old_state = "TheOldState-#{Time.now.to_s}"
      new_state = "tHEnEWsTATE-#{Time.now.to_s}"
      old_details = "Any details will suffice."
      new_details = "No details are accepted!"

      b = Book.find(@book.pid)
      b.preservation_state = old_state
      b.preservation_details = old_details
      b.save!

      d = b.preservation_modify_date

      b = Book.find(@book.pid)
      b.preservation_state.should == old_state
      b.preservation_state.should_not == new_state
      b.preservation_details.should == old_details
      b.preservation_details.should_not == new_details

      put :update_preservation_metadata, {:id => @book.pid, :preservation => {:preservation_state => new_state, :preservation_details => new_details }}
      response.should redirect_to(@book)

      b = Book.find(@book.pid)
      b.preservation_state.should == new_state
      b.preservation_state.should_not == old_state
      b.preservation_details.should == new_details
      b.preservation_details.should_not == old_details
      b.preservation_modify_date.should_not == d
    end

    it 'should not update when same values' do
      state = "TheState-#{Time.now.to_s}"
      details = "TheDetails-#{Time.now.to_s}"

      b = Book.find(@book.pid)
      b.preservation_state = state
      b.preservation_details = details
      b.save!

      d = b.preservation_modify_date

      put :update_preservation_metadata, {:id => @book.pid, :preservation => {:preservation_state => state, :preservation_details => details }}
      response.should redirect_to(@book)

      b = Book.find(@book.pid)
      b.preservation_state.should == state
      b.preservation_details.should == details
      b.preservation_modify_date.should == d
    end

  end

  after(:all) do
    Book.all.each { |book| book.delete }
    BasicFile.all.each { |bf| bf.delete }
    TiffFile.all.each { |tf| tf.delete }
    Person.all.each { |p| p.delete }
    SingleFileRepresentation.all.each { |dr| dr.delete }
    OrderedRepresentation.all.each { |rep| rep.delete }
  end

end
