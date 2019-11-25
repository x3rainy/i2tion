class Specialisation < ApplicationRecord
  validates :name, presence: true, inclusion: { in: ['Mathematics',
    'Algebra',
    'Geometry',
    'Science',
    'Geography',
    'History',
    'English',
    'Spanish',
    'German',
    'French',
    'Latin',
    'Greek',
    'Arabic',
    'Computer Science',
    'Art',
    'Economics',
    'Music',
    'Drama',
    'Physical Education'] }
  has_many :tutor_specialisations
  has_many :tutors, through: :tutor_specialisations
end
