class ItemImagesController < ApplicationController
  def index
    @item_images = ItemImage.all

    respond_to do |format|
      format.html
      format.csv { send_data render_to_string, filename: "item_images.csv", type: :csv }
    end
  end
end
