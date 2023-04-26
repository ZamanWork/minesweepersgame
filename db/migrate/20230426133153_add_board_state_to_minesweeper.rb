class AddBoardStateToMinesweeper < ActiveRecord::Migration[7.0]
  def change
    add_column :minesweepers, :board_state, :jsonb, default: []
  end
end
