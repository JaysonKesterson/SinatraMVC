class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
    t.string :goal_name
    t.string :description
    t.string :achieved?
    end
  end
end
