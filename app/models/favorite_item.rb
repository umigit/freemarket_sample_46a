class FavoriteItem < ApplicationRecord
  belongs_to :user, optional: true
end
