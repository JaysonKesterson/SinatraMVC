class Goal < ActiveRecord::Base
  belongs_to :user
  validates :goal_name, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :achieved, presence: true
end