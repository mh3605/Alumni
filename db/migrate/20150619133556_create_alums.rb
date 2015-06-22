class CreateAlums < ActiveRecord::Migration
  def change
    create_table :alums do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :about

      t.timestamps null: false
    end
  end
end
