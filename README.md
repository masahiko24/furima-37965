# README
# テーブル設計

## users テーブル

| Column             | Type     | Options     |
| ------------------ | ------   | ----------- |
| nickname           | string   | null: false |
| email              | string   | null: false |
| encrypted_password | string   | null: false |
| name               | string   | null: false |
| name_reading       | string   | null: false |
| birthdate          | datetime | null: false |



### Association

- has_many :items
- has_many :buys

## items テーブル

| Column                      | Type       | Options                       |
| -------------------------   | ------     | ----------------------------- |
| brandname                   | string     | null: false                   |
| description                 | string     | null: false                   |
| details_category_id         | integer    | null: false                   |
| details_condition_id        | integer    | null: false                   |
| delivery_charges_id         | integer    | null: false                   |
| delivery_area_id            | integer    | null: false                   |
| delivery_number_of_date_id  | integer    | null: false                   |
| user                        | references | null: false foreign_key: true |

### Association

- belongs_to :user


## buys テーブル

| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| phone_number  | string     | null: false                    |
| comment_text  | text       | null: false                    |
| user          | references | null: false, foreign_key: true |
| items         | references | null: false, foreign_key: true |

### Association

- has_one :address
- belongs_to :user

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture    | integer    | null: false                    |
| city          | string     | null: false                    |
| house_number  | string     | null: false                    |
| building_name | string     | null: false                    |
| user          | references | null: false, foreign_key: true |
| room          | references | null: false, foreign_key: true |

### Association

- belongs_to :buys
