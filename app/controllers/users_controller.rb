class UsersController < ApplicationController
  before_action :get_categories, only: [:index, :logout, :edit]

  def index
  end

  def logout
  end

  def card
  end

  def edit
  end

  private

  def get_categories
    @all_categories = Category.all
  end
end
