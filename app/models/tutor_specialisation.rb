class TutorSpecialisation < ApplicationRecord
  belongs_to :specialisation
  belongs_to :tutor

  validates :tutor, presence: true
  validates :specialisation, presence: true, uniqueness: { scope: :specialisation, message: "Already has this specialisation" }
end
