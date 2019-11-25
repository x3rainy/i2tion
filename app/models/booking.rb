class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tutor
  has_many :reviews

  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
end
