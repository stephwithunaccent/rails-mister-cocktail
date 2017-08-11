class Dose < ApplicationRecord
  belongs_to :ingredient
  belongs_to :cocktail

  validates :description, presence: true
  validates_associated :cocktail, :ingredient
  validates :ingredient, uniqueness: { scope: :cocktail }
  # validates_uniqueness_of :ingredient_id, scope: [:cocktail_id]
end
