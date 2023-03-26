# テーブル設計

## users テーブル

| Column             | Type     | Options                   |              
| ------------------ | -------- | -----------               |
| nickname           | string   | null: false               |
| email              | string   | null: false, unique: true |
| encrypted_password | string   | null: false               |
| last_name          | string   | null: false               |
| first_name         | string   | null: false               |
| last_name_kana     | string   | null: false               |
| first_name_kana    | string   | null: false               |
| birth_year         | datetime | null: false               |
| birth_month        | datetime | null: false               |
| birth_day          | datetime | null: false               |


### Association

- has_many :items
- has_many :buys

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| explanation     | text       | null: false                    |
| category        | string     | null: false                    |
| situation       | string     | null: false                    |
| price           | integer    | null: false                    |
| commission      | integer    | null: false                    |
| profit          | integer    | null: false                    |
| region_area     | string     | null: false                    |
| shipping_days   | string     | null: false                    |
| delivery_charge | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |
| buy             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |
| shipping_address | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :shipping_address



## shipping_addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| post_code    | integer    | null: false                    |
| prefectures  | string     | null: false,                   |
| municipality | string     | null: false,                   |
| address      | string     | null: false,                   | 
| building     | string     | null: false,                   |
| tel_number   | string     | null: false,                   |
| buy          | references | null: false, foreign_key: true |

### Association

- belongs_to :buy