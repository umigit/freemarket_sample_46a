class ItemImagesController < ApplicationController
  def new
  end

  def create
    # ItemImage.create(item_images_params)
  end

  private

  def item_images_params
    # params.require(:item_image).permit(:image)
  end
end
