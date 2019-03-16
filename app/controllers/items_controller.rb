class ItemsController < ApplicationController
  def new
    @categories = Category.ransack(parent_id_null: true).result
    @regions = Region.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
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
    params.require(:item).permit(:name, :comment, :category_id, :brand_id, :shipping_fee, :region_id, :days_to_ship, :price, :condition).merge(user_id: current_user.id)
  end


end
