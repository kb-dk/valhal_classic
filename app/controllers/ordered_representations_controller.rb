# -*- encoding : utf-8 -*-
class OrderedRepresentationsController < ApplicationController
  load_and_authorize_resource
  def index
    @single_file_representations = OrderedRepresentation.all
  end

  def show
    @single_file_representation = OrderedRepresentation.find(params[:id])
  end

  def edit
    @single_file_representation = OrderedRepresentation.find(params[:id])
  end

  def update
    @single_file_representation = OrderedRepresentation.find(params[:id])

    if @single_file_representation.update_attributes(params[:single_file_representation])
      redirect_to @single_file_representation, notice: 'Ordered representation was successfully updated.'
    else
      render action: "edit"
    end
  end
end
