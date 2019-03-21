class ItemsController < ApplicationController
  def indexs
  end

  def new
    @item = Item.new
    @item.item_images.build
    @categories = Category.ransack(parent_id_null: true).result
    @brands = Brand.all
    @regions = Region.all
    @itemimage = ItemImage.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save

    else

    end
  end

  def edit
    @item = Item.find(params[:id])
    # @item_images = @item.item_images
    # @item.item_images.build
    @categories = Category.ransack(parent_id_null: true).result

  end

  def update
    @item = Item.find(params[:id])
    @item.update
  end

  def category
    @categories = Category.ransack(parent_id_eq: params[:id]).result

    respond_to do |format|
      format.html
      format.json {render json: @categories}
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :prefecture_id, :days_to_ship, :price, :condition, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def buy
  end
end
