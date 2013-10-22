# -*- encoding : utf-8 -*-
require 'spec_helper'
require 'support/representation_spec_helper'

describe SingleFileRepresentation do
  include RepresentationSpecHelper

  subject { SingleFileRepresentation.new }
  it_behaves_like 'a preservable element'

  it "should have a datastream named descMetadata " do
    subject.descMetadata.should_not be_nil
  end

  it 'should have a datastream named rightsMetadata' do
    subject.rightsMetadata.should_not be_nil
  end

  it 'should have a datastream named provenanceMetadata' do
    subject.provenanceMetadata.should_not be_nil
  end

  describe "#ie" do
    context "with a book" do

      let(:default_ie) do
        Book.create(title: "test book")
      end

      it 'should be able to have a association with a book' do
        association_with_ie subject, default_ie
      end

      it 'should be able to saved with a association with a book' do
        save_ie_association subject, default_ie

      end

      it 'should be able to retrieve a book from a saved Representation' do
        ie_from_saved_rep subject, default_ie
      end

      it 'should be able to get values from a book via representation' do
        values_from_ie_via_rep subject, default_ie, :title
      end

      context "with a person" do
        let(:default_ie) do
          Person.all.each { |p| p.delete }
          Person.create(firstname: "the firstname", lastname: "the lastname", :date_of_birth => Time.now.nsec.to_s)
        end

        it 'should be able to have a association with a person' do
          association_with_ie subject, default_ie
        end

        it 'should be able to saved with a association with a person' do
          save_ie_association subject, default_ie
        end

        it 'should be able to retrieve a person from a saved Representation' do
          ie_from_saved_rep subject, default_ie
        end

        it 'should be able to get values from a person via representation' do
          values_from_ie_via_rep subject, default_ie, :firstname
        end
      end
    end
  end

  describe "#basic_files" do
    context "with multiple BasicFiles" do
      let(:default_files) do
        array = []
        (1..3).each do
          basic_file = BasicFile.new
          uploaded_file = ActionDispatch::Http::UploadedFile.new(filename: 'aarrebo_tei_p5_sample.xml', type: 'text/xml', tempfile: File.new("#{Rails.root}/spec/fixtures/aarrebo_tei_p5_sample.xml"))
          basic_file.add_file(uploaded_file)
          basic_file.save!
          array << basic_file
        end
        array
      end

      it 'should be able to have a association with BasicFiles' do
        basic_files = default_files
        subject.files << basic_files
        subject.files.should == basic_files
      end

      it 'should be able to be saved with a association to BasicFiles' do
        basic_files = default_files
        subject.files << basic_files
        subject.save.should be_true
      end

      it 'should be able to retrieve BasicFiles from a saved representation' do
        basic_files = default_files
        subject.files << basic_files
        subject.save
        pid = subject.pid
        def_rep = subject.class.find(pid)
        def_rep.files.should == basic_files
      end
    end
  end

  describe 'with a single basic_files' do
    it 'should have a representation name containing the basic_files content type' do
      basic_file = BasicFile.new
      uploaded_file = ActionDispatch::Http::UploadedFile.new(filename: 'aarrebo_tei_p5_sample.xml', type: 'text/xml', tempfile: File.new("#{Rails.root}/spec/fixtures/aarrebo_tei_p5_sample.xml"))
      basic_file.add_file(uploaded_file)
      rep = SingleFileRepresentation.create!

      rep.files << basic_file

      rep.representation_name.include?(basic_file.file_type).should be_true
    end
  end
end
