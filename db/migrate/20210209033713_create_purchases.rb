class CreatePurchases < ActiveRecord::Migration[6.0]
  def change
    create_table :purchases do |t|
      t.string     :postalc,        null: false
      t.integer    :prefecture_id,  null: false
      t.string     :municipality,   null: false
      t.string     :address,        null: false
      t.string     :building
      t.string     :phonen,         null: false
      t.references :precord,        foreign_key: true

      t.timestamps
    end
  end
end
