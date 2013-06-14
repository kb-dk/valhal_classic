# -*- encoding : utf-8 -*-
class OrderedRepresentationsController < ApplicationController
  load_and_authorize_resource

  def show
    @ordered_representation = OrderedRepresentation.find(params[:id])
  end

  def edit
    @ordered_representation = OrderedRepresentation.find(params[:id])
  end

  def update
    @ordered_representation = OrderedRepresentation.find(params[:id])

    if @ordered_representation.update_attributes(params[:ordered_representation])
      redirect_to @ordered_representation, notice: 'Ordered representation was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # Retrieves the thumbnail of the Tiff-image with the given pid.
  # @param pid The id of the file to extract the thumbnail for.
  # @return The thumbnail of the image, or nil if no file was found.
  def thumbnail_url(pid = nil)
    if pid.nil?
      if params[:pid].blank?
        send_data({}, {:status => 404})
        return
      end
      pid = params[:pid]
    end

    file = TiffFile.find(pid)

    if file.datastreams['thumbnail'].nil?
      send_data({}, {:status => 404})
      return
    end

    send_data(file.thumbnail.content, {:filename => file.thumbnail.label, :type => file.thumbnail.mimeType, :disposition => 'inline'})
  end
end
