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
  has_attached_file :image, styles: {thumb: "150x150#"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
