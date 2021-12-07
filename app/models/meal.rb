class Meal < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :favorites, dependent: :destroy

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :meal_time

  with_options presence: true do
    validates :name
    validates :amount_before_type_cast, format: { with: /\A[0-9]+\z/, allow_blank: true, message: 'は半角数字で入力してください' }
    validates :calorie_before_type_cast, format: { with: /\A[0-9]+\z/, allow_blank: true, message: 'は半角数字で入力してください' }
    validates :meal_time_id, numericality: { other_than: 1, message: 'を選択してください' }
  end
end
