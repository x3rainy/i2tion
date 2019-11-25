class TutorSpecialisation < ApplicationRecord
  belongs_to :specialisation
  belongs_to :tutor
  validates :tutor_id, presence: true
  validates :specialisation_id, presence: true
end
