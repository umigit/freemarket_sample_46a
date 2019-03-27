class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    @ladies = Item.ransack(by_category_id: 1.0).result.limit(4)
    @mens = Item.ransack(by_category_id: 2).result.limit(4)
    @kids = Item.ransack(by_category_id: 3).result.limit(4)
    @janel = Item.ransack(brand_id_eq: 1).result.limit(4)
    @biton = Item.ransack(brand_id_eq: 3).result.limit(4)
    @shrimp = Item.ransack(brand_id_eq: 4).result.limit(4)
    @mike = Item.ransack(brand_id_eq: 2).result.limit(4)
  end

  def show
    @item = Item.find(params[:id])
    @categories = Category.ransack(parent_id_null: true).result
    @janel = Item.ransack(brand_id_eq: 1).result.limit(3)
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
      respond_to do |format|
        format.html
        format.json {render json: @item}
      end
    else
      respond_to do |format|
        format.html
        format.json render :new
      end
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.ransack(parent_id_null: true).result
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  def category
    @categories = Category.ransack(parent_id_eq: params[:id]).result

    respond_to do |format|
      format.html
      format.json {render json: @categories.select(:id, :name)}
    end
  end


  def destroy
    item = Item.find(params[:id])
    if item.user_id == current_user.id
      item.destroy
      redirect_to onsale_user_items_path, flash: {success: '商品を削除しました'}
    end
  end

  def search
    @items = Item.ransack(name_cont: params[:keyword]).result
  end

  private

  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :prefecture_id, :days_to_ship, :price, :condition, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end

  def buy
  end
end
