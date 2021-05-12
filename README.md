# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| nickname      | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| last_name     | string  | null: false |
| first_name    | string  | null: false |
| lname_reading | string  | null: false |
| fname_reading | string  | null: false |
| year          | integer | null: false |
| month         | integer | null: false |
| day           | integer | null: false |


### Association

extend ActiveHash::Associations::ActiveRecordExtensions
- has_many :items
- has_many :delivery_info
- has_many :comments
- belongs_to :year
- belongs_to :month
- belongs_to :day


## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| image         |            |                                |
| item_name     | string     | null: false                    |
| item_explain  | text       | null: false                    |
| category      | integer    | null: false                    |
| item_status   | text       | null: false                    |
| delivery_fee  | text       | null: false                    |
| prefecture    | integer    | null: false                    |
| delivery_date | text       | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

extend ActiveHash::Associations::ActiveRecordExtensions
- has_one :delivery_info
- has_many :comments
- belongs_to :user
- belongs_to :category
- belongs_to :prefecture


## delivery_info テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | -------------------------------|
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

extend ActiveHash::Associations::ActiveRecordExtensions
- belongs_to :user
- belongs_to :item
- belongs_to :prefecture


## comments テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | -------------------------------|
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item


## year テーブル

### Association
include ActiveHash::Associations
- has_many :users


## month テーブル

### Association
include ActiveHash::Associations
- has_many :users


## day テーブル

### Association
include ActiveHash::Associations
- has_many :users


## category テーブル

### Association
include ActiveHash::Associations
- has_many :itmes


## prefecture テーブル

### Association
include ActiveHash::Associations
- has_many :itmes
- has_many :delivery_info