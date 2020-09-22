# テーブル設計

## users テーブル

| Column            | Type      | Options     |
| ----------------- | --------- | ----------- |
| nickname          | string    | null: false |
| email             | string    | null: false |
| password          | string    | null: false |
| first_name        | string    | null: false |
| last_name         | string    | null: false |
| first_name_kana   | string    | null: false |
| last_name_kana    | string    | null: false |
| birth_data        | date      | null: false |

### Association
- has_many :items
- has_many :purchases

## items テーブル 

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| description   | text       | null: false                    |
| category      | integer    | null: false                    |
| status        | integer    | null: false                    |
| shopping_cost | integer    | null: false                    |
| area          | integer    | null: false                    |
| shopping_day  | integer    | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :purchase
- belongs_to_active_hash :category
- belongs_to_active_hash :status
- belongs_to_active_hash :shopping_cost
- belongs_to_active_hash :area 
- belongs_to_active_hash :shopping_day

## purchase テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | references | null: false, foreign_key: true |
| item_id | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :address

## address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| city_block    | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :purchase
- belongs_to_active_hash :prefecture

