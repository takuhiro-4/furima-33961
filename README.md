# テーブル設計

## usersテーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| nickname   | string | null: false |
| email      | string | null: false |
| password   | string | null: false |
| kjname     | string | null: false |
| namekj     | string | null: false |
| knname     | string | null: false |
| namekn     | string | null: false |
| dob        | date   | null: false |

 has_many :items
 has_many :precords


## itemsテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| description | text    | null: false |
| kategory_id | integer | null: false |
| state_id    | integer | null: false |
| burden_id   | integer | null: false |
| area_id     | integer | null: false |
| sipping_id  | integer | null: false |
| price       | integer | null: false |

 belongs_to :user
 has_one :precord


## purchaseテーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| postalc      | string     | null: false       |
| prefectures  | integer    | null: false       |
| municipality | string     | null: false       |
| address      | string     | null: false       |
| building     | string     |                   |
| phonen       | string     | null: false       |
| precord      | references | foreign_key: true |

 belongs_to :precord


## precord

| Column | Type       | Options           |
| ------ | ---------- | ----------------- |
| user   | references | foreign_key: true |
| item   | references | foreign_key: true |

 belongs_to :user
 belongs_to :item
 has_one :purchase