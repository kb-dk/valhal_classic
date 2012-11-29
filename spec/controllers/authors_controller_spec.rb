# -*- encoding : utf-8 -*-
require 'spec_helper'


describe AuthorsController do
  describe "#index" do
    before do
      @author = Author.create
    end

    it "should have the newly created author in the index, and it should be of the type Author" do
      get :index
      assigns[:authors].should include @author
      assigns[:authors].each { |a| a.should be_kind_of Author }
      response.should be_successful
    end
  end

  describe "#new" do

    it "should create a new instance of type Author" do
      get :new
      assigns[:author].should be_kind_of Author
      response.should be_successful
    end
  end

  describe "#create" do
    before do
      Author.find_each { |b| b.delete }
      Author.count.should == 0
    end

    it "Should create a author" do
      post :create, :author => {:forename => "Dude", :surname => "Miller"}
      Author.count.should == 1
      response.should redirect_to authors_path
      flash[:notice].should == "forfatter er blevet tilføjet"
    end
  end

  describe "#edit" do
    before do
      @author = Author.create
    end

    it "should be able to edit the requested author" do
      get :edit, :id => @author.pid
      assigns[:author].should == @author
      response.should be_successful
    end
  end

  describe "#update" do
    before do
      @author = Author.create
    end

    it "should update the author" do
      put :update, :id => @author.pid, :author => {:forename => "Alex"}
      flash[:notice].should == "Forfatter er blevet ændret"
      response.should redirect_to authors_path
      @author = Author.find(@author.pid)
      @author.forename.should == "Alex"

    end
  end

  describe "#show" do
    before do
    @author = Author.create(forename: "Alex", surname: "Boesen")
    end

    it "should show the new created author" do
      get :show, :id => @author.pid
      assigns[:author].should == @author
      response.should be_successful
    end
  end
end
