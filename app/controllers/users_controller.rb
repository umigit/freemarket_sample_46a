class UsersController < ApplicationController
  before_action :get_categories, only: [:index]


  def index
  end

  def logout
  end

  def card
  end

end
