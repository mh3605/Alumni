class DeleteRolesAndInstalls < ActiveRecord::Migration
  def change
  	drop_table :installs
  	drop_table :roles
  end
end
