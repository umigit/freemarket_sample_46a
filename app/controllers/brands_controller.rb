class BrandsController < ApplicationController
  def show
    @brand = Brand.find(params[:id])
    @items = Item.ransack(brand_id_eq: params[:id]).result
  end
end
