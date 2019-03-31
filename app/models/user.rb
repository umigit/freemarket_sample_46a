class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  validates :email,                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'のフォーマットが不適切です' }
  has_many :sns_credentials
  has_one :user_profile, dependent: :destroy
  accepts_nested_attributes_for :user_profile, update_only: true

  def self.from_omniauth(auth)
    credential = SnsCredential.where(provider: auth.provider, uid: auth.uid).first

    if credential
      user = User.find(credential.user_id)
    else
      user = User.where(email: auth.info.email).first_or_create do |u|
        u.password = Devise.friendly_token[0,20]
      end
      SnsCredential.create(provider: auth.provider, uid: auth.uid, user_id: user.id)

      user
    end
  end

  def with_user_profile
    self.user_profile.build
    self
  end
end
