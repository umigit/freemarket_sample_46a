class ItemImagesController < ApplicationController
  def destroy
    item_image = ItemImage.find(params[:id])
    item_image.destroy
  end
end

