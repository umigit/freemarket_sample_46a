class UsersController < ApplicationController

  before_action :get_categories, only: [:index, :card, :logout]


  def index
  end

  def logout
  end

  def card
  end


  private

  def get_categories
    @all_categories = Category.all
  end
end
