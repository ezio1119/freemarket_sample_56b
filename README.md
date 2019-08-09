# README

# DB設計

## Itemsテーブル

|Column|Type|Options|
|------|----|-------|
|size|string|
|name|text|null: false, index: true|
|delivery|integer|null: false|
|region|integer|null: false|
|days|integer|null: false|
|price|integer|null: false, CHECK (price >= 300, price <= 9999999)|
|info|text|null: false, limit: 1000|
|user|referencess|foreign_key: true|
|category|references|foreign_key: true|

### Association

- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :attached, dependent: :destroy
- has_many :item_categories
- has_many :categories, through: :item_categories


## Categoryテーブル

|Column|Type|Options|
|------|----|-------|
|class_id|integer|null: false|
|name|integer|null: false|

### Association

- has_many :item_categories
- has_many :items, through: :item_categories


## Item_Categoryテーブル

|Column|Type|Options|
|------|----|-------|
|item|references|foreign_key: true|
|category|references|foreign_key: true|

### Association

- belongs_to :item
- belongs_to :category


## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, add_index: true|
|email|string|null: false, unique: true|
|password|string|null: false, length: { in: 7..128 }|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_ruby|string|null: false|
|last_name_ruby|string|null: false|
|birth_date|date|null: false|
|phone_number|integer|
|phone_number_authentication|boolean|
|item|references|foreign_key: true|
|comment|references|foreign_key: true|

### Association
- has_one :card, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy

## Addressテーブル
|postcode|string|null: false|
|prefecture_id|integer|null: false|
|city|string|null: false|
|block|string|null: false|
|building|string|
|user|references|foreign_key: true|

### Association
- belongs_to :user


## Cardsテーブル
|Column|Type|Options|
|------|----|-------|
|cord_number|string|null: false|
|expiration_date|date|null: false|
|security_code|integer|null: false|
|user|references|foreign_key: true|

### Association
- belongs_to :user


## Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|comment|text|null: false|
|item|references|foreign_key: true|
|user|references|foreign_key: true|

### Association
- belongs_to :item
- belongs_to :user


