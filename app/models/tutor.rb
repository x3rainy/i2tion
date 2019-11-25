class Tutor < ApplicationRecord
  belongs_to :user
  has_many :tutor_specialisations
  has_many :specialisations, through: :tutor_specialisations

  validates :age, presence: true
  validates :gender, presence: true
  validates :bio, presence: true
  validates :activity_status, presence: true
end
