class Doctor < ApplicationRecord
  has_many :diagnoses
  has_many :patients, :through => :diagnoses

end
