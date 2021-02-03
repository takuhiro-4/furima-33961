class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :password, format: { with: /\A[a-z0-9]+\z/i, message: "is invalid. Input half-width characters."}, length: { minimum: 6 }
    validates :nickname
    validates :kjname, format: { with: /\A[一-龥ぁ-ん]/ }
    validates :namekj, format: { with: /\A[一-龥ぁ-ん]/ }
    validates :knname, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :namekn, format: { with: /\A[ァ-ヶー－]+\z/ }
    validates :dob
    end

end
