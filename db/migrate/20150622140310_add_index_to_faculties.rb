class AddIndexToFaculties < ActiveRecord::Migration
  def up
	  add_column :faculties, :department_id, :integer
	  add_column :faculties, :researcharea_id, :integer
  end

  def down
	  remove_column :faculties, :department_id
	  remove_column :faculties, :researcharea_id
  end
end
