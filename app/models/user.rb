class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2, :facebook]
  validates :email,                  format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i, message: 'のフォーマットが不適切です' }
  has_many :sns_credentials

  has_one :user_profile, dependent: :destroy
  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :user_profile, update_only: true
  accepts_nested_attributes_for :address, update_only: true

  has_many :comments


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

  enum years: {"1980": 1, "1981": 2, "1982": 3, "1983": 4, "1984": 5, "1985": 6, "1986": 7, "1987": 8, "1988": 9, "1989": 10, "1990": 11, "1991": 12, "1992": 13, "1993": 14,  "1994": 15, "1995": 16, "1996": 17, "1997": 18, "1998": 19, "1999": 20, "2000": 21, "2001": 22, "2002": 23, "2003": 24, "2004": 25, "2005": 26, "2006": 27, "2007": 28, "2008": 29, "2009": 30, "2010": 31, "2011": 32, "2012": 33, "2013": 34, "2014": 35, "2015": 36, "2016": 37, "2017": 38, "2018": 39, "2019": 40 }

  enum months: {"1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7":7, "8": 8, "9": 9, "10": 10, "11": 11, "12": 12}



end
