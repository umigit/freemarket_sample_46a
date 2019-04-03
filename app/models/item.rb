class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  enum condition: {"新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}
  enum days_to_ship: {"1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}
  enum shipping_fee: {"着払い(購入者負担)": false, "送料込み(出品者負担)": true}

  belongs_to_active_hash :prefecture
  belongs_to :user
  belongs_to :category
  belongs_to :brand, optional: true
  has_many :item_images, dependent: :destroy
  has_many :comments
  accepts_nested_attributes_for :item_images

  validates :name, presence: true
  validates :comment, presence: true
  validates :shipping_fee, presence: true
  validates :days_to_ship, presence: true
  validates :condition, presence: true
  validates :price, presence: true, numericality: { greater_than: 300, less_than: 9999999 }

  validates :item_images, length: { minimum: 1, maximum: 10}

  scope :by_category_id, -> (id) {eager_load(category: :parent).where("category_id = ? or categories.parent_id = ? or parents_categories.parent_id = ?", id, id, id)}

  def self.ransackable_scopes(auth_object = nil)
    %i[by_category_id]
  end
end
