class ItemImagesController < ApplicationController
  def update
    item_image = ItemImage.find(params[:id])
    if item_image.update(item_image_params)
      respond_to do |format|
        format.html
        format.json
      end
    else
      render :edit
    end
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

