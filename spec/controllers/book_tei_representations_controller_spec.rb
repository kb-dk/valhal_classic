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

describe BookTeiRepresentationsController do

  # This should return the minimal set of attributes required to create a valid
  # BookTeiRepresentation. As you add validations to BookTeiRepresentation, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {  }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # BookTeiRepresentationsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all book_tei_representations as @book_tei_representations" do
      book_tei_representation = BookTeiRepresentation.create! valid_attributes
      get :index, {}, valid_session
      assigns(:book_tei_representations).should include book_tei_representation
    end
  end

  describe "GET show" do
    it "assigns the requested book_tei_representation as @book_tei_representation" do
      book_tei_representation = BookTeiRepresentation.create! valid_attributes
      get :show, {:id => book_tei_representation.to_param}, valid_session
      assigns(:book_tei_representation).should eq(book_tei_representation)
    end
  end

  describe "GET new" do
    it "assigns a new book_tei_representation as @book_tei_representation" do
      get :new, {}, valid_session
      assigns(:book_tei_representation).should be_a_new(BookTeiRepresentation)
    end
  end

  describe "GET edit" do
    it "assigns the requested book_tei_representation as @book_tei_representation" do
      book_tei_representation = BookTeiRepresentation.create! valid_attributes
      get :edit, {:id => book_tei_representation.to_param}, valid_session
      assigns(:book_tei_representation).should eq(book_tei_representation)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new BookTeiRepresentation" do
        expect {
          post :create, {:book_tei_representation => valid_attributes}, valid_session
        }.to change(BookTeiRepresentation, :count).by(1)
      end

      it "assigns a newly created book_tei_representation as @book_tei_representation" do
        post :create, {:book_tei_representation => valid_attributes}, valid_session
        assigns(:book_tei_representation).should be_a(BookTeiRepresentation)
        assigns(:book_tei_representation).should be_persisted
      end

      it "redirects to the created book_tei_representation" do
        post :create, {:book_tei_representation => valid_attributes}, valid_session
        response.should redirect_to(BookTeiRepresentation.all.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved book_tei_representation as @book_tei_representation" do
        # Trigger the behavior that occurs when invalid params are submitted
        BookTeiRepresentation.any_instance.stub(:save).and_return(false)
        post :create, {:book_tei_representation => {  }}, valid_session
        assigns(:book_tei_representation).should be_a_new(BookTeiRepresentation)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        BookTeiRepresentation.any_instance.stub(:save).and_return(false)
        post :create, {:book_tei_representation => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested book_tei_representation" do
        book_tei_representation = BookTeiRepresentation.create! valid_attributes
        # Assuming there are no other book_tei_representations in the database, this
        # specifies that the BookTeiRepresentation created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        BookTeiRepresentation.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => book_tei_representation.to_param, :book_tei_representation => { "these" => "params" }}, valid_session
      end

      it "assigns the requested book_tei_representation as @book_tei_representation" do
        book_tei_representation = BookTeiRepresentation.create! valid_attributes
        put :update, {:id => book_tei_representation.to_param, :book_tei_representation => valid_attributes}, valid_session
        assigns(:book_tei_representation).should eq(book_tei_representation)
      end

      it "redirects to the book_tei_representation" do
        book_tei_representation = BookTeiRepresentation.create! valid_attributes
        put :update, {:id => book_tei_representation.to_param, :book_tei_representation => valid_attributes}, valid_session
        response.should redirect_to(book_tei_representation)
      end
    end

    describe "with invalid params" do
      it "assigns the book_tei_representation as @book_tei_representation" do
        book_tei_representation = BookTeiRepresentation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BookTeiRepresentation.any_instance.stub(:save).and_return(false)
        put :update, {:id => book_tei_representation.to_param, :book_tei_representation => {  }}, valid_session
        assigns(:book_tei_representation).should eq(book_tei_representation)
      end

      it "re-renders the 'edit' template" do
        book_tei_representation = BookTeiRepresentation.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        BookTeiRepresentation.any_instance.stub(:save).and_return(false)
        put :update, {:id => book_tei_representation.to_param, :book_tei_representation => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested book_tei_representation" do
      book_tei_representation = BookTeiRepresentation.create! valid_attributes
      expect {
        delete :destroy, {:id => book_tei_representation.to_param}, valid_session
      }.to change(BookTeiRepresentation, :count).by(-1)
    end

    it "redirects to the book_tei_representations list" do
      book_tei_representation = BookTeiRepresentation.create! valid_attributes
      delete :destroy, {:id => book_tei_representation.to_param}, valid_session
      response.should redirect_to(book_tei_representations_url)
    end
  end

end
