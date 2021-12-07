class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :meals
  has_many :favorites, dependent: :destroy

  with_options presence: true do
    validates :nickname
    validates :gender
    validates :age_before_type_cast, format: { with: /\A[0-9]+\z/, allow_blank: true, message: 'は半角数字で入力してください' }
    validates :height_before_type_cast, format: { with: /\A[0-9]+\z/, allow_blank: true, message: 'は半角数字で入力してください' }
    validates :weight_before_type_cast, format: { with: /\A[0-9]+\z/, allow_blank: true, message: 'は半角数字で入力してください' }
  end

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, allow_blank: true, message: 'には半角英字と半角数字の両方を含めて設定してください'
end
