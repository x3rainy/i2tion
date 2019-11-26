class Booking < ApplicationRecord
  has_many :reviews
  belongs_to :user
  belongs_to :tutor

  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
end
