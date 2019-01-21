class Patient < ApplicationRecord
  has_many :diagnoses
  has_one :meal_plan
end
