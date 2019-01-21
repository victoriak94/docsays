class Diagnosis < ApplicationRecord
  belongs_to :patient
  belongs_to :doctor
  has_one :diet
end
