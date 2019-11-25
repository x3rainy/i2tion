class Tutor < ApplicationRecord
  belongs_to :user

  validates :age, presence: true
  validates :gender, presence: true
  validates :bio, presence: true
  validates :activity_status, presence: true
end
