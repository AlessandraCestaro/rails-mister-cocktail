class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient

  validates :description, :cocktail_id, :ingredient_id, presence: true
  validates_uniqueness_of :cocktail, scope: :ingredient
  # validates_uniqueness_of :dose_id, :scope => [:cocktail_id, :ingredient_id]
end
