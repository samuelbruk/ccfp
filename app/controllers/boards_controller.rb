class BoardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_board, only: [:show, :edit, :update, :destroy]
  def index
    @boards = current_user.boards.order(created_at: :desc)
  end

  def show
    @lists = @board.lists.order(created_at: :asc)
    @list = List.new
    @card = Card.new
    # @relationship = Relationship
    @collaborations = Relationship.where(user_id: current_user, board_id: @board)
  end

  def new
    @board = Board.new
  end

  def create
    @board = current_user.boards.new(board_params)

    if @board.save
      redirect_to board_path(@board), notice: "New board created!"
    else
      flash[:error] = 'Failed to create a board!'
      render :new
    end
  end

  def edit
  end

  def update
    if @board.update board_params
      redirect_to board_path(@board), notice: 'Board edited!'
    else
      flash[:error] = 'Board could not be edited'
      render :edit
    end
  end

  def delete
  end

  def destroy
    if @board.destroy
      redirect_to boards_path, notice: "Board deleted!"
    else
      flash[:error] = "Board could not be deleted!"
      redirect_to boards_path
    end
  end

  private
  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end
end
