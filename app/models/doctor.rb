class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :diagnoses
  has_many :patients, :through => :diagnoses

  validates :email, presence: true
  validates :name, presence: true
  validates :specialization, presence: true
end
