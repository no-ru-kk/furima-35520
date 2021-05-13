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
| days_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Association

- has_one :record
- belongs_to :user


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

- belongs_to :record


## records テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | -------------------------------|
| user       | references | null: false, foreign_key: true |
| item       | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :item
- has_one :delivery_info
