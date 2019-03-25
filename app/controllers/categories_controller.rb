class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @items = Item.ransack(by_category_id: params[:id]).result
  end
end
