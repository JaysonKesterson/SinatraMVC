class Goal < ActiveRecord::Base
  belongs_to :user
  validates :goal_name, presence: true, length: { in: 6..50 }
  validates :description, presence: true, length: { in: 6..200 }
  validates :achieved, presence: true
end