class BoardsController < ApplicationController
  def index
    @boards = Board.order(created_at: :desc)
  end

  def show
    @board = find_board
    @lists = @board.lists.order(created_at: :desc)
    @list = List.new
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      flash[:notice] = 'New board created!'
      redirect_to boards_path
    else
      flash[:error] = 'Failed to create a board!'
      render :new
    end
  end

  def edit
    @board = find_board
  end

  def update
    @board = find_board
    if @board.update board_params
      flash[:notice] = 'Board edited!'
      redirect_to board_path(@board)
    else
      flash[:error] = 'Board could not be edited'
      render :edit
    end
  end

  def delete
  end

  def destroy
    @board = find_board
    if @board.destroy
      flash[:notice] = "Board deleted!"
      redirect_to boards_path
    else
      flash[:error] = "Board could not be deleted!"
      redirect_to boards_path
    end
  end

  private
  def find_board
    Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
