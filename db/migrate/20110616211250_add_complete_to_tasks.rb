class AddCompleteToTasks < ActiveRecord::Migration
  def self.up
    add_column :tasks, :complete, :datetime
  end

  def self.down
    remove_column :tasks, :complete
  end
end
