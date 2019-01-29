class MealPlan < ApplicationRecord
  belongs_to :patient
  
  # def self.search(search)
  #   where("name LIKE ?", "%#{search}%")
  #   where("content LIKE ?", "%#{search}%")
  # end

end
