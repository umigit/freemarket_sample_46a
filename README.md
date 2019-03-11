# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

Mercari DB

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|last_name|str|null: false|
|first_name|str|null: false|
|last_name_kana|str|null: false|
|first_name_kana|str|null: false|
|phone||int|null: false, unique: true|
|paying-way|int|null: false|
|birth_y|int|null: false|
|birth_m|int|null: false|
|birth_d|int|null: false|
|mail|str|null: false, unique: true|
|password|str|null: false, unique: true|
|nickname|str|null: false, unique: true|
|comment|text|null: true|
|avatar|text|null: true|

### Association
- belongs_to :group
- belongs_to :user

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|postal_code|int|null: false|
|region_id|ref|null: false,foregin_key: true|
|city|str|null: false|
|block|str|null: false|
|building|str|null: true|
|user_id|ref|null: false,foregin_key: true|

## regionテーブル
|Column|Type|Options|
|------|----|-------|
|name|str|null: false, unique: true|
|parent_id|int|null: true|

## follow-relationshipテーブル
|Column|Type|Options|
|------|----|-------|
|following_id|int|null: false, add_index/add_foreign_key|
|follower_id|int|null: false, add_index/add_foreign_key|

