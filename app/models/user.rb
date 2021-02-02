class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :kjname, presence: true
  validates :namekj, presence: true
  validates :knname, presence: true
  validates :namekn, presence: true
  validates :dob, presence: true

end
