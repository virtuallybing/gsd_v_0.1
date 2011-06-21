class AddScheduleIdToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :schedule_id, :integer
  end

  def self.down
    remove_column :tasks, :schedule_id
  end
end
