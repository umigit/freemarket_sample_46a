# Mercari DB

## user

|Column|Type|Options|
|------|----|-------|
|phone||int|null: false, unique: true|
|paying_way|int|null: false|
|mail|str|null: false, unique: true|
|password|str|null: false, unique: true|
|comment|text|null: true|


### Association
- has_many :addresses, dependent: :destroy
- has_many :order_status
- has_many :items
- has_many :comments
- has_many :favorite_items, dependent: :destroy
- has_many :point_records
- has_many :money_records
- has_many :user-evaluations

### Option

- "paying_wayカラムはenumで管理"

## user_profile

|Column|Type|Options|
|------|----|-------|
|last_name|str|null: false|
|first_name|str|null: false|
|last_name_kana|str|null: false|
|first_name_kana|str|null: false|
|birth_y|int|null: false|
|birth_m|int|null: false|
|birth_d|int|null: false|
|nickname|str|null: false, unique: true|
|avatar|text|null: true|


## address

|Column|Type|Options|
|------|----|-------|
|postal_code|int|null: false|
|region_id|ref|null: false,foregin_key: true|
|city|str|null: false|
|block|str|null: false|
|building|str|null: true|
|user_id|ref|null: false,foregin_key: true|

### Association
- belongs_to :user
- belongs_to :region

## region
|Column|Type|Options|
|------|----|-------|
|name|str|null: false, unique: true|
|parent_id|int|null: true|

### Association
- has_many :addresses

## point_transaction-record
|Column|Type|Options|
|------|----|-------|
|user_id|ref|null: false, foregin_key: true|
|point|int|null: false|
|order_status_id|ref|null: false, foregin_key: true|

### Association
- belongs_to :user
- belongs_to :order-status

## money_transaction_record
|Column|Type|Options|
|------|----|-------|
|user_id|ref|null: false, foregin_key: true|
|point|int|null: false|
|order_status_id|ref|null: false, foregin_key: true|

### Association
- belongs_to :user
- belongs_to :order-status

## user_evaluation
|Column|Type|Options|
|------|----|-------|
|high_count|int|null: true|
|medium_count|int|null: true|
|low_count|int|null: true|
|evaluating_id|int|null: false, add_index/add_foreign_key|
|evaluated_id|int|null: false, add_index/add_foreign_key|
|comment|text|null: true|

### Association
- belongs_to :user

## favorite_item
|Column|Type|Options|
|------|----|-------|
|user_id|ref|null: false, foregin_key: true|
|item_id|ref|null: false, foregin_key: true|

### Association
- belongs_to :user
- belongs_to :item

## order_status
|Column|Type|Options|
|------|----|-------|
|purchaser_id|int|null: false, add_index/add_foreign_key|
|seller_id|int|null: false, add_index/add_foreign_key|
|status|int|null: false|
|item_id|ref|null: false, foregin_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one :point_record
- has_one :money_record

### Option

- "statusカラムはenumで管理 （例：1→orderd等)"

## comment
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|ref|null: false, foregin_key: true|
|item_id|ref|null: false, foregin_key: true|

### Association
- belongs_to :item
- belongs_to :user

## item
|Column|Type|Options|
|------|----|-------|
|name|str|null: true|
|comment|text|null: true|
|category_id|ref|null: false, foregin_key: true|
|brand_id|int|null: true, foregin_key: true|
|shipping_fee|bln|null: false|
|region_id|ref||null: false, foregin_key: true|
|days_to_ship|int|null: false|
|price|int|null: false|
|condition|int|null: false|
|user_id|ref|null: false, foregin_key: true|
|closed|bln|null: false, default: false|

### Association
- has_many :item_photos
- has_many :comments
- has_many :order_statuses
- belongs_to :user
- belongs_to :category

### Option
- "conditionカラムはenumで管理"
- "days_to_shipカラムはenumで管理"

## item_photo
|Column|Type|Options|
|------|----|-------|
|image|str|null: false|
|item_id|ref|null: false, foregin_key: true|

### Association
- belongs_to :item


## category
|Column|Type|Options|
|------|----|-------|
|name|str|null: false|
|parent_id|int|null: true|

### Association
- has_many :items

## brand
|Column|Type|Options|
|------|----|-------|
|name|str|null: false|
|parent_id|int|null: true|

### Association
- has_many :items
