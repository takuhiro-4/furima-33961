class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: 'is invalid. Input half-width characters.' },
                         length: { minimum: 6 }
    validates :nickname
    validates :dob
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ } do
    validates :kjname
    validates :namekj
  end

  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :knname
    validates :namekn
  end

  has_many :items
end
