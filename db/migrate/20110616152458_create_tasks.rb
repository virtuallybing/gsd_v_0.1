class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.datetime :due
      t.string :title
      t.string :description
      t.datetime :complete
      t.integer :schedule_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
