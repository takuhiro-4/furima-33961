class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :burden
  belongs_to :kategory
  belongs_to :sipping
  belongs_to :state

  belongs_to :user
  has_one :precord
  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :description
    validates :price, format: { with: /\A-?[0-9]+(\.[0-9]+)?\z/ },
                      numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  with_options presence: true, numericality: { other_than: 0 } do
    validates :kategory_id
    validates :state_id
    validates :burden_id
    validates :area_id
    validates :sipping_id
  end
end
