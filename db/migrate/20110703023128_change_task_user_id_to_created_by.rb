class ChangeTaskUserIdToCreatedBy < ActiveRecord::Migration
  def self.up
    rename_column :tasks, :user_id, :created_by
  end

  def self.down
  end
end
