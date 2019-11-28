class Booking < ApplicationRecord
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  has_one :review
  belongs_to :user
  belongs_to :tutor

  validates :start_datetime, presence: true
  validates :end_datetime, presence: true
end
