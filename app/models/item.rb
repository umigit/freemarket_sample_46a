class Item < ApplicationRecord
  enum condition:{"新品、未使用": 1, "未使用に近い": 2, "目立った傷や汚れなし": 3, "やや傷や汚れあり": 4, "傷や汚れあり": 5, "全体的に状態が悪い": 6}
  enum days_to_ship: {"1~2日で発送": 1, "2~3日で発送": 2, "4~7日で発送": 3}
  enum shipping_fee: {"着払い(購入者負担)": 1, "送料込み(出品者負担)": 2}

  belongs_to :user, optional: true
end
