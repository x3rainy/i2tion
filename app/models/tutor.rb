class Tutor < ApplicationRecord
  belongs_to :user
<<<<<<< HEAD
  has_many :tutor_specialisations
  has_many :specialisations, through: :tutor_specialisations
=======
  has_many :bookings
  has_many :reviews, through: :bookings
>>>>>>> master

  validates :age, presence: true
  validates :gender, presence: true
  validates :bio, presence: true
  validates :activity_status, presence: true
end
