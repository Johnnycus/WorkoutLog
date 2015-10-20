class Exercise < ActiveRecord::Base
  belongs_to :workout
  validates :name, presence: true, length: { maximum: 25 }
  validates :sets, presence: true
  validates :reps, presence: true
end
