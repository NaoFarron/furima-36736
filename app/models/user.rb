class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }, allow_blank: true

  validates :nickname, presence: true

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, allow_blank: true }, presence: true do
    validates :last_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶ]+\z/, allow_blank: true }, presence: true do
    validates :last_name_kana
    validates :first_name_kana
  end

  validates :birthday, presence: true
end
