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
| birth_data        | date      | null: false |

### Association
- has_many :users_items
- has_many :items,through: users_items


## items テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| description   | text    | null: false |
| price         | integer | null: false |

### Association
- has_one :users_items
- has_one :addresses
- has_many :users, through: users_items


## users_items テーブル

| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| user_id | integer | null: false |
| item_id | integer | null: false |

### Association
- belongs_to :user
- belongs_to :item

## addresses

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | string  | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone number | string  | null: false |

### Association
- belongs_to :item