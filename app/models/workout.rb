class Workout < ActiveRecord::Base
  has_many :exercises, dependent: :destroy
  belongs_to :user

  validates :date,    presence: true
  validates :workout, presence: true, length: { maximum: 40 }
  validates :mood,    presence: true
  validates :length,  presence: true
  validates :user_id, presence: true
end
