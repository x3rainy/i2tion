class Booking < ApplicationRecord
  has_one :review
  belongs_to :user
  belongs_to :tutor

  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
end
