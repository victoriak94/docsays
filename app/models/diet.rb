class Diet < ApplicationRecord
  belongs_to :diagnosis
  has_one(:patient, {:through => :diagnosis})

  validates :name, presence: true
  validates :avoid, presence: true
  validates :eat, presence: true
end
