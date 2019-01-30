class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :diagnoses
  has_one :meal_plan
  has_attached_file :image, styles: {thumb: "150x150#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  extend Devise::Models

  validates :email, presence: true
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true }
  validates :sex, presence: true, length: { maximum: 1 }
end
