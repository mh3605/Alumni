class AddIdsToUser < ActiveRecord::Migration
  def up
  	add_column :users, :faculty_id, :integer, :default => :null
  	add_column :users, :alum_id, :integer, :default => :null
  	add_column :alums, :user_id, :integer, :default => :null
  	add_column :faculties, :user_id, :integer, :default => :null
  end

  def down
  	remove_column :users, :faculty_id
  	remove_column :users, :alum_id
  	remove_column :alums, :user_id
  	remove_column :faculties, :user_id
  end
end
