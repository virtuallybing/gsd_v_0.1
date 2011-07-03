class CreateTaskLinks < ActiveRecord::Migration
  def self.up
    create_table :task_links do |t|
      t.integer :user_id
      t.integer :task_id

      t.timestamps
    end
  end

  def self.down
    drop_table :task_links
  end
end
