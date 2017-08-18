class CardsController < ApplicationController
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

  def destroy
    @card = find_card
    if @card.destroy
      redirect_to board_path(@card.list.board), notice: "Card deleted!"
    else
      flash[:error] = 'Card could not be deleted!'
      redirect_to board_path(@card.list.board)
    end
  end

  private
  def find_card
    Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name)
  end
end
