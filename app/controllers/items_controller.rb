class ItemsController < ApplicationController
  def new
    @categories = Category.ransack(parent_id_null: true).result
    @regions = Region.all
  end

  def create
  end

  def category
    @categories = Category.ransack(parent_id_eq: params[:id]).result

    respond_to do |format|
      format.html
      format.json {render json: @categories}
    end
  end
end
