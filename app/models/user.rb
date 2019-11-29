class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :bookings
  has_many :reviews
  has_many :tutors, through: :bookings
  has_one :tutor

  # validates :name, presence: true, on: :update
  # validates :phone_number, presence: true, on: :update

  # def tutor_profile
  #   Tutor.find_by(user_id: current_user.id) if Tutor.exists?(user_id: current_user.id)
  # end

  # def is_tutor?
  #   return false if tutor_profile.nil?

  #   return true
  # end
end
