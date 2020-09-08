# テーブル設計

## users テーブル

| Column            | Type      | Options     |
| ----------------- | --------- | ----------- |
| nickname          | string    | null: false |
| email             | string    | null: false |
| password          | string    | null: false |
| family_name       | string    | null: false |
| first_name        | string    | null: false |
| family_name_kana  | string    | null: false |
| first_name_kana   | string    | null: false |
| birth_year        | integer   | null: false |
| birth_month       | integer   | null: false |
| birth_day         | integer   | null: false |

### Association
- has_many :users_items
- has_many :items,through: users_items
- has_many :comments

## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| image         | string  | null: false |
| name          | string  | null: false |
| description   | string  | null: false |
| category      | string  | null: false |
| status        | string  | null: false |
| shopping_cost | string  | null: false |
| area          | string  | null: false |
| shopping_dey  | date    | null: false |
| price         | integer | null: false |

### Association
- has_many :users_items
- has_many :users, through: users_items
- has_many :messages

## users_items テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| user_id | integer | null: false |
| item_id | integer | null: false |

### Association
- belongs_to :user
- belongs_to :item

## comments テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| user_id | integer | null: false |
| item_id | integer | null: false |
| comment | integer | null: false |

### Association
- belongs_to :user
_ belongs_to :item
