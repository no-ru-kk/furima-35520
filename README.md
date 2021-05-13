# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| lname_reading      | string  | null: false               |
| fname_reading      | string  | null: false               |
| birth_date         | date    | null: false               |


### Association

- has_many :items
- has_many :records


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| name          | string     | null: false                    |
| item_explain  | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| fee_id        | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| date_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

extend ActiveHash::Associations::ActiveRecordExtensions
- has_one :record
- belongs_to :user
- belongs_to :category
- belongs_to :status
- belongs_to :fee
- belongs_to :prefecture
- belongs_to :date


## delivery_info テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| record        | references | null: false, foreign_key: true |

### Association

extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :record
- belongs_to :prefecture


## records テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | -------------------------------|
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_info


## category テーブル

### Association
include ActiveHash::Associations
- has_many :itmes


## status テーブル

### Association
include ActiveHash::Associations
- has_many :items


## fee テーブル

### Association
include ActiveHash::Associations
- has_many :items


## prefecture テーブル

### Association
include ActiveHash::Associations
- has_many :itmes
- has_many :delivery_info


## date テーブル

### Association
include ActiveHash::Associations
- has_many :items