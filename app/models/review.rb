class Review < ApplicationRecord
  belongs_to :booking, optional: true
  belongs_to :tutor
  belongs_to :user

  validates :content, presence: true
  validates :stars, numericality: true, presence: true, inclusion: {
    in: [0, 1, 2, 3, 4, 5]
  }
end
