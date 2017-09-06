class ChecklistsController < ApplicationController
  # before_action :authenticate_user!
  before_action :find_checklist, only: [:delete, :toggle]

  def index
    # @boards = current_user.boards.order(created_at: :desc)
  end

  def show
    # @board = find_board
    # @lists = @board.lists.order(created_at: :desc)
    # @list = List.new
    # @card = Card.new
  end

  def new
    # @board = Board.new
    @card = Card.find(params[:card_id])
    @checklist = Checklist.new
  end

  def create
    @card = Card.find(params[:card_id])
    @checklist = @card.checklists.build(checklist_params)

    if @checklist.save
      # redirect_to board_path(@card.list.board), notice: "New List Created!"
    else
      flash[:error] = 'Failed to create a card!'
      redirect_to board_path(@card.list.board)
    end
  end

  def edit
    # @board = find_board
  end

  def update
    # @board = find_board
    # if @board.update board_params
    #   redirect_to board_path(@board), notice: 'Board edited!'
    # else
    #   flash[:error] = 'Board could not be edited'
    #   render :edit
    # end
  end

  def delete
  end

  def destroy
    # @board = find_board
    # if @board.destroy
    #   redirect_to boards_path, notice: "Board deleted!"
    # else
    #   flash[:error] = "Board could not be deleted!"
    #   redirect_to boards_path
    # end
  end

  def toggle
    is_checked = !(@checklist.is_checked)
    @checklist.update(is_checked: is_checked)
  end

  private
  def find_checklist
    @checklist = Checklist.find(params[:id])
  end

  def checklist_params
    params.require(:checklist).permit(:content)
  end
end
