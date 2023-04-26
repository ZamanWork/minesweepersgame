  class MinesweepersController < ApplicationController
  before_action :set_minesweeper, only: %i[ show minecheck restart ]
  
  def index
    @minesweepers = Minesweeper.all.paginate(page: params[:page], per_page: 10)
  end
  
  def show
  end
  
  def new
    @minesweeper = Minesweeper.new
  end
  
  def create
    @minesweeper = Minesweeper.new(minesweeper_params)
    respond_to do |format|
      board = generate_board(@minesweeper.width, @minesweeper.height, @minesweeper.mines)
      @minesweeper.board_state = board
      if @minesweeper.save
        format.html { redirect_to minesweeper_url(@minesweeper), notice: "Minesweeper was successfully created." }
        format.json { render :show, status: :created, location: @minesweeper }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @minesweeper.errors, status: :unprocessable_entity }
      end
    end
  end

  def minecheck
    board = @minesweeper.board_state
    @minesweeper.clicked_cells << [params[:cell][0].to_i, params[:cell][1].to_i]
    @minesweeper.update(clicked_cells: @minesweeper.clicked_cells)
    if board[params[:cell][0].to_i][params[:cell][1].to_i] == 1
      flash[:alert] = "Game over! You hit a mine at #{params[:cell][0].to_i}, #{params[:cell][1].to_i}."
      @minesweeper.clicked_cells = []
      @minesweeper.update(game_over: true, clicked_cells: @minesweeper.clicked_cells)
    end
    if @minesweeper.clicked_cells.length == board.flatten.length - @minesweeper.mines
      flash[:success] = "You win the game."
      @minesweeper.clicked_cells = []
      @minesweeper.update(game_over: true, clicked_cells: @minesweeper.clicked_cells)
    end
    return redirect_to minesweeper_path(@minesweeper)
  end

  def restart
    board = @minesweeper.board_state
    @minesweeper.clicked_cells = []
    @minesweeper.update(clicked_cells: @minesweeper.clicked_cells)
    return redirect_to minesweeper_path(@minesweeper)
  end

  private
  
  def set_minesweeper
    @minesweeper = Minesweeper.find(params[:id])
  end
  
  def minesweeper_params
    params.require(:minesweeper).permit(:name, :email, :width, :height, :mines)
  end

  def generate_board(width, height, num_mines)
    board = Array.new(height) { Array.new(width, 0) }
    mines_placed = 0
    
    while mines_placed < num_mines
      x = rand(width)
      y = rand(height)
      
      next if board[y][x] == 1
      
      board[y][x] = 1
      mines_placed += 1
    end
    
    board
  end
end
