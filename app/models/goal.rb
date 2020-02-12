class Goal < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :goal_name, :description, :achieved
end