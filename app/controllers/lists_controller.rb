class ListsController < ApplicationController
  # def index
  # end

  def show
    @list = find_list
  end

  def new
    @board = Board.find(params[:board_id])
    @list = List.new
  end

  def create
    @board = Board.find(params[:board_id])
    @list = @board.lists.build(list_params)

    if @list.save
      flash[:notice] = 'New List created!'
      redirect_to board_path(@board)
    else
      flash[:error] = 'Failed to create a list'
      render :new
    end
  end

  def destroy
    @list = find_list
    @board = @list.board
    if @list.destroy
      flash[:notice] = 'List deleted!'
      redirect_to board_path(@board)
    else
      flash[:error] = 'List could not be deleted!'
      redirect_to board_path(@board)
    end
  end

  private
  def find_list
    List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
