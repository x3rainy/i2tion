class Tutor < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :global_search,
    against: [:gender],
    associated_against: {
      user: [:name],
      specialisations: [:name]
    },
    using: {
      tsearch: { prefix: true }
    }

  mount_uploader :photo, PhotoUploader

  belongs_to :user

  has_many :tutor_specialisations, dependent: :destroy
  has_many :specialisations, through: :tutor_specialisations
  has_many :bookings, dependent: :destroy
  has_many :reviews
  has_many :users, through: :bookings

  validates :age, presence: true, inclusion: { in: 12..90 }
  validates :gender, presence: true
  validates :bio, presence: true
  validates :activity_status, presence: true
  validates :user, presence: true, uniqueness: true
  validates :photo, presence: true
end
