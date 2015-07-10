class DeleteAlumIdAndFacutlyIdColumns < ActiveRecord::Migration
  def change
  	  remove_column :users, :alum_id
	  remove_column :users, :faculty_id
  end
end
