class Run < ApplicationRecord
  belongs_to :runner, foreign_key: :runner_id, class_name: :User
  belongs_to :companion, foreign_key: :companion_id, class_name: :User, optional: true
  validates :runner_id, :run_date, :time, :zipcode, presence: true
  geocoded_by :zipcode
  before_validation :geocode

  def converted_date
    DateTime.parse(self.run_date)
  end

  def run_hours
  end

  def run_minutes
  end

  def run_daypart
  end

end
