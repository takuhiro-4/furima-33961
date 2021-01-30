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
# has_many p.record


## itemsテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| i.name      | string  | null: false |
| description | text    | null: false |
| kategory    | integer | null: false |
| state       | integer | null: false |
| burden      | integer | null: false |
| area        | integer | null: false |
| sipping     | integer | null: false |
| price       | integer | null: false |

# belongs_to user
# has_one p.record


## purchaseテーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| postal.c    | string  | null: false |
| prefectures | integer | null: false |
| prefectures | string  | null: false |
| address     | string  | null: false |
| building    | string  | null: false |
| phone.n     | string  | null: false |

# belongs_to p.record


## p.record

| Column | Type      | Options     |
| ------ | --------- | ----------- |
| users  | reference |             |
| items  | reference |             |

# belongs_to user
# belongs_to item
# has_one purchase