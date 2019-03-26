class AddressesController < ApplicationController
  before_action :get_categories, only: [:edit]

  def new
  end

  def create
  end

  def edit
  end

  def create
  end

  private

  def get_categories
    @all_categories = Category.all
  end
end
