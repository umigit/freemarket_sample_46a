class UserProfile < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
<<<<<<< HEAD

  belongs_to :user, inverse_of: :user_profile, optional: true
=======
  belongs_to :user
>>>>>>> origin/user-registration-new
end
