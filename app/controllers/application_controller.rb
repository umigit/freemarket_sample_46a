class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def get_categories
    @all_categories = Category.all
  end
end
