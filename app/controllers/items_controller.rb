class ItemsController < ApplicationController
  def new
    @categories = Category.ransack(parent_id_null: true).result
  end

  def create
  end

  def category

  end
end
