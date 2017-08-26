class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_card, only: [:show, :edit, :destroy]

  def show
    @checklists = @card.checklists
    @checklist = Checklist.new
    @comment = Comment.new
    respond_to do |format|
      format.js { render :show}
    end
  end

  def new
    @list = List.find(params[:list_id])
    @card = Card.new
  end

  def create
    @list = List.find(params[:list_id])
    @card = @list.cards.build(card_params)

    if @card.save
      redirect_to board_path(@list.board), notice: "New List Created!"
    else
      flash[:error] = 'Failed to create a list!'
      redirect_to board_path(@list.board)
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @card.update card_params
        format.js { render :card_update_success }
      else
        format.js { render :card_update_fail}
      end
    end
  end

  def destroy
    if @card.destroy
      redirect_to board_path(@card.list.board), notice: "Card deleted!"
    else
      flash[:error] = 'Card could not be deleted!'
      redirect_to board_path(@card.list.board)
    end
  end

  private
  def find_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :description, :dead_line)
  end
end
