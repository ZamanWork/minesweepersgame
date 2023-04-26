json.extract! minesweeper, :id, :name, :email, :width, :height, :mines, :created_at, :updated_at
json.url minesweeper_url(minesweeper, format: :json)
