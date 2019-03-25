class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :get_categories

  def get_categories
    @all_categories = Category.all
  end
end
