class CategoriesController < ApplicationController
  def show
    @items = Item.ransack(by_category_id: params[:id]).result
  end
end
