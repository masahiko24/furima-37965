# README
# テーブル設計

## users テーブル

| Column             | Type     | Options                   |
| ------------------ | ------   | ------------------------  |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| first_name         | string   | null: false               |
| last_name          | string   | null: false               |
| first_name_reading | string   | null: false               |
| last_name_reading  | string   | null: false               |
| birthday           | date     | null: false               |



### Association

- has_many :items
- has_many :ordres

## items テーブル

| Column                      | Type       | Options                       |
| -------------------------   | ------     | ----------------------------- |
| brandname                   | string     | null: false                   |
| description                 | text       | null: false                   |
| details_category_id         | integer    | null: false                   |
| details_condition_id        | integer    | null: false                   |
| delivery_charge_id          | integer    | null: false                   |
| delivery_area_id            | integer    | null: false                   |
| delivery_number_of_date_id  | integer    | null: false                   |
| price                       | integer    | null: false                   |
| user                        | references | null: false foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| item          | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item

## addresses テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| delivery_area_id | integer    | null: false                    |
| city             | string     | null: false                    |
| house_number     | string     | null: false                    |
| building_name    | string     |                     |
| phone_number     | string     | null: false                    |
| order              | references | null: false, foreign_key: true |


### Association

- belongs_to :order
