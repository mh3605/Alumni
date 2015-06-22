class EditIndexOfFaculties < ActiveRecord::Migration
  def up
	remove_column :faculties, :phone
	add_column :faculties, :uid, :integer
	add_column :alums, :uid, :integer
  end

  def down
  	add_column :faculties, :phone, :string
	remove_column :faculties, :uid 
	remove_column :alums, :uid 
  end
end
