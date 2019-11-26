class Tutor < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  belongs_to :user

  has_many :tutor_specialisations, dependent: :destroy
  has_many :specialisations, through: :tutor_specialisations
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy

  validates :age, presence: true, inclusion: { in: 12..90 }
  validates :gender, presence: true
  validates :bio, presence: true
  validates :activity_status, presence: true
end
