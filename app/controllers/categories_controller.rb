class CategoriesController < ApplicationController
  before_action :get_categories

  def show
    @category = Category.find(params[:id])
    @items = Item.ransack(by_category_id: params[:id].to_f).result
  end
end
