class UserProfilesController < ApplicationController
  before_action :get_categories, only: [:edit]

  def edit
  end

  def update
  end

  private

  def get_categories
    @all_categories = Category.all
  end
end
