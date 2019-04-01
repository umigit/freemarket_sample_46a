class ItemImagesController < ApplicationController
  def update
    item_image = Itemimage.find(params[:id])
    item_image.update(item_image_params)
  end
  def destroy
    item_image = ItemImage.find(params[:id])
    item_image.destroy
  end

  private

  def item_image_params
    params.require(:item_image).permit(:image)
  end
end

