class Tutor < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :age, presence: true
  validates :gender, presence: true
  validates :bio, presence: true
  validates :activity_status, presence: true
end
