class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, presence: { message: 'A cozinha deve ter um nome' }
  validates :name, uniqueness: { message: 'Esse nome de cozinha ja existe' }
end
