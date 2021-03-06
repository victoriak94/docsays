class Diet < ApplicationRecord
  belongs_to :diagnosis
  has_one(:patient, {:through => :diagnosis})

  validates :name, presence: true
end
