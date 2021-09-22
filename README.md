# DB 設計

## users table

| Column             | Type                  | Options                 |
|--------------------|-----------------------|-------------------------|
| nickname           | string                | null: false             |
| email              | string                | null: false             |
| encrypted_password | string                | null: false             |
| last_name          | string                | null: false             |
| first_name         | string                | null: false             |
| last_name_kana     | string                | null: false             |
| first_name_kana    | string                | null: false             |
| birthday           | integer               | null: false             |

### Association

- has_many :items
- has_many :buys
- has_many :deliveries

## items table

| Column                    | Type       | Options           |
|---------------------------|------------|-------------------|
| title                     | text       | null: false       |
| explanation               | text       | null: false       |
| category                  | string     | null: false       |
| item_Status               | string     | null: false       |
| delivery_fee              | string     | null: false       |
| shipping_area             | string     | null: false       |
| estimated_shipping_date   | string     | null: false       |
| price                     | integer    | null: false       |
| seller                    | references | foreign_key: true |


### Association

- belongs_to :user
- has_one :buys
- has_one :deliveries

## buys table

| Column          | Type       | Options           |
|-----------------|------------|-------------------|
| buyer           | references | foreign_key: true |
| purchased_item  | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
- has_one : deliveries


## deliveries table

| Column            | Type       | Options      |
|-------------------|------------|--------------|
| postal_code       | string     | null: false  |
| prefecture        | string     | null: false  |
| city              | string     | null: false  |
| address           | string     | null: false  |
| building_name     | string     | null: false  |
| telephone_number  | integer    | null: false  |

### Association

- belongs_to :user
- belongs_to :items
- belongs_to :buys
