class UserProfile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
end
