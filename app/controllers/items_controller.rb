class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :pay, :buy, :sold]
  before_action :current_user_not_buy, only: [:buy]
  before_action :buy_not_sold, only: [:sold]
  before_action :buy_sold, only: [:buy]
  

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
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def new
    @item = Item.new
    @item.item_images.build
    @categories = Category.ransack(parent_id_null: true).result
  end

  def create
    @item = Item.new(item_params)
    @categories = Category.ransack(parent_id_null: true).result
    if @item.save
      respond_to do |format|
        format.html
        format.json {render json: @item}
      end
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    @categories = Category.ransack(parent_id_null: true).result
  end


  def pay
    item = Item.find(params[:id])
      Payjp.api_key = 'sk_test_c28ae49cafa2c8609f211aea'
      charge = Payjp::Charge.create(
      amount: item.price,
      card: params['payjp-token'],
      currency: 'jpy')
    item.sales_condition = true
    item.save

    status = OrderStatus.create(purchaser_id: current_user.id, seller_id: item.user.id, item_id: item.id)

    if charge.present?
      redirect_to "/items/#{item.id}/sold"
    else
      redirect_to  "/items/#{item.id}"
    end
  end



  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      respond_to do |format|
        format.html
        format.json {render json: @item}
      end
    else
      render :edit
    end
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
      redirect_to onsale_user_items_path(current_user), flash: {success: '商品を削除しました'}
    end
  end

  def search
    @items = Item.ransack(name_cont: params[:keyword]).result
  end

  def onsale
    @items = Item.ransack(user_id_eq: current_user.id)
  end

  def buy
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  def sold
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end




  private

  def buy_not_sold
    item = Item.find(params[:id])
    unless item.sales_condition
      redirect_to "/items/#{item.id}/buy"
    end
  end

  def buy_sold
    item = Item.find(params[:id])
    if item.sales_condition == true
      redirect_to "/items/#{item.id}/sold"
    end
  end

  def current_user_not_buy
    item = Item.find(params[:id])
    if current_user.id == item.user.id
      redirect_to "/items/#{item.id}"
    end
  end

  def item_params
    params.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :prefecture_id, :days_to_ship, :price, :condition, item_images_attributes: [:image]).merge(user_id: current_user.id)
  end


end
