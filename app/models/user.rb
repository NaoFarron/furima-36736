class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
         validates :password, format: {with: VALID_PASSWORD_REGEX}, allow_blank: true

         validates :nickname, presence: true
         
         VALID_NAME_REGEX = /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ 
          validates :last_name, format: {with: VALID_NAME_REGEX}, allow_blank: true
          validates :last_name, presence: true
          validates :first_name, format: {with: VALID_NAME_REGEX}, allow_blank: true
          validates :first_name, presence: true

         VALID_NAME_KANA_REGEX = /\A[ァ-ヶ]+\z/
          validates :last_name_kana, format: { with: VALID_NAME_KANA_REGEX }, allow_blank: true 
          validates :last_name_kana, presence: true
          validates :first_name_kana, format: { with: VALID_NAME_KANA_REGEX }, allow_blank: true 
          validates :first_name_kana, presence: true
         
         
         validates :birthday, presence: true
end
