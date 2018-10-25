class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails

  validates :name, presence: true
  validates_uniqueness_of :name

  # before_destroy :check_for_cocktails

  # private

  # def check_for_cocktails
  #   if cocktails.count > 0
  #     errors.add_to_base("cannot delete ingredient while cocktails with ingredients exist")
  #     return false
  #   end
  # end

end
