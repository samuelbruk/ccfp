class CardsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_card, only: [:show, :edit, :update, :destroy, :add_label, :add_due_date]

  def show
    @checklists = @card.checklists.order(:created_at)
    @checklist = Checklist.new
    @comment = Comment.new
    @label = Label.new
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
    if @card.update card_params
      respond_to do |format|
        format.js { render :card_update_success }
      end
    else
      respond_to do |format|
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

  def add_label #TODO refactor this to a more appropriate controller
    #@card = Card.find(params[:id])
    @names = label_param.split(/\s*,\s*/)
    @names.each do |name|
      @card.labels << Label.where(name: name.downcase).first_or_create!
    end
    respond_to do |format|
      format.js { render :label_add_success }
    end
  end

  def add_due_date
    if @card.update(dead_line: due_date_param)
      respond_to do |format|
        format.js { render :add_due_date_success }
      end
    end
  end

  private
  def find_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:name, :description, :dead_line)
  end

  def label_param
    params.require(:name)
  end

  def due_date_param
    params.require(:dead_line)
  end
end
