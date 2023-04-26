class CreateMinesweepers < ActiveRecord::Migration[7.0]
  def change
    create_table :minesweepers do |t|
      t.string :name
      t.string :email
      t.integer :width
      t.integer :height
      t.integer :mines

      t.timestamps
    end
  end
end
