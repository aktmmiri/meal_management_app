class MealTime < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '朝食' },
    { id: 3, name: '昼食' },
    { id: 4, name: '夕食' },
    { id: 5, name: '夜食' },
    { id: 6, name: '間食' }
  ]

  include ActiveHash::Associations
  has_many :meals
end
