class Goal < ActiveRecord::Base
  belongs_to :user
  validates :goal_name, presence: true, length: { in: 1..50 }
  validates :description, presence: true, length: { in: 1..200 }
  validates :achieved, presence: true
end