class Item < ApplicationRecord
  belongs_to :user, optional: true
end
