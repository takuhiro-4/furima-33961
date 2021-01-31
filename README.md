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

# has_many items
# has_many precord


## itemsテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| name        | string  | null: false |
| description | text    | null: false |
| kategory    | integer | null: false |
| state_id    | integer | null: false |
| burden_id   | integer | null: false |
| area_id     | integer | null: false |
| sipping_id  | integer | null: false |
| price_id    | integer | null: false |

# belongs_to user
# has_one p.record


## purchaseテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postalc      | string  | null: false |
| prefectures  | integer | null: false |
| municipality | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phonen       | string  | null: false |

# belongs_to precord


## precord

| Column | Type      | Options           |
| ------ | --------- | ----------------- |
| user   | reference | foreign_key: true |
| item   | reference | foreign_key: true |

# belongs_to user
# belongs_to item
# has_one purchase