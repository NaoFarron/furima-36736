# DB 設計

## users table

| Column             | Type                  | Options                  |
|--------------------|-----------------------|--------------------------|
| nickname           | string                | null: false              |
| email              | string                | null: false, unique:true |
| encrypted_password | string                | null: false              |
| last_name          | string                | null: false              |
| first_name         | string                | null: false              |
| last_name_kana     | string                | null: false              |
| first_name_kana    | string                | null: false              |
| birthday           | date                  | null: false              |

### Association

- has_many :items
- has_many :buys

## items table

| Column                     | Type       | Options           |
|----------------------------|------------|-------------------|
| title                      | string     | null: false       |
| explanation                | text       | null: false       |
| category_id                | integer    | null: false       |
| item_Status_id             | integer    | null: false       |
| delivery_fee_id            | integer    | null: false       |
| shipping_area_id           | integer    | null: false       |
| estimated_shipping_date_id | integer    | null: false       |
| price                      | integer    | null: false       |
| user_id                    | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :buy

## buys table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| user_id         | references | foreign_key: true |
| item_id         | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one : deliveries


## deliveries table

| Column            | Type       | Options            |
|-------------------|------------|--------------------|
| postal_code       | string     | null: false        |
| prefecture_id        | integer     | null: false        |
| city              | string     | null: false        |
| address           | string     | null: false        |
| building_name     | string     |                    |
| telephone_number  | integer    | null: false        |
| buy_id            | references | foreign_key: true  |

### Association

- belongs_to :buys
