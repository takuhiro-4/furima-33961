class Order
  include ActiveModel::Model
  attr_accessor :postalc, :prefecture_id, :municipality, :address, :building, :phonen, :price, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id
    validates :postalc, format: { with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id, numericality: {other_than: 0}
    validates :municipality
    validates :address
    validates :phonen
  end
  
# データをテーブルに保存する処理
  def save
    precord = Precord.create(user_id: user_id, item_id: item_id)
    Purchase.create(postalc: postalc, prefecture_id: prefecture_id, municipality: municipality, address: address, building: building, phonen: phonen, precord_id: precord.id)
  end
end