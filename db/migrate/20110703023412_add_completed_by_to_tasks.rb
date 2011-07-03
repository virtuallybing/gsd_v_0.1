class AddCompletedByToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :completed_by, :integer
  end

  def self.down
    remove_column :tasks, :completed_by
  end
end
