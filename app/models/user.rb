class User < ApplicationRecord
  has_secure_password
  has_one :profile
  has_many :runs, foreign_key: :runner_id
  has_many :runs_as_companion, foreign_key: :companion_id, class_name: 'Run'

  validates :name, :zipcode, presence: true
  validates :zipcode, length: { minimum: 5 , maximum: 5 }
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }, uniqueness: true, presence: true
  validates :password, length: { minimum: 8, maximum: 20 }
  validates :password_confirmation, presence: true
  geocoded_by :zipcode
  before_validation :geocode
  # after_validation :geocode

  # def narrow_by_experience(run_seeker)
  #   self.profile.experience == run_seeker.profile.experience
  # end
end
