class CreateInitialemployers < ActiveRecord::Migration
  def change
    create_table :initialemployers do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
