class UserProfile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
end
