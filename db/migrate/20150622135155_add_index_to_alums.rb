class AddIndexToAlums < ActiveRecord::Migration
  def up
	add_column :alums, :faculty_id, :integer
	add_column :alums, :department_id, :integer
	add_column :alums, :researcharea_id, :integer
	add_column :alums, :initialemployer_id, :integer
	add_column :alums, :year_id, :integer
  end

  def down
	remove_column :alums, :faculty_id
	remove_column :alums, :department_id
	remove_column :alums, :researcharea_id
	remove_column :alums, :initialemployer_id
	remove_column :alums, :year_id
  end
end
