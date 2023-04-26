class AddClickedCellsAndGameOverToMinesweepers < ActiveRecord::Migration[7.0]
  def change
    add_column :minesweepers, :clicked_cells, :jsonb, default: []
    add_column :minesweepers, :game_over, :boolean, default: false
  end
end
