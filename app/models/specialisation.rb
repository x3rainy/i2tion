class Specialisation < ApplicationRecord
  has_many :tutor_specialisations
  has_many :tutors, through: :tutor_specialisations

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
end
