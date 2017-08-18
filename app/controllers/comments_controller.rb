class CommentsController < ApplicationController
  before_action :find_comment, only: [:destroy]
  def create
    @card = Card.find(params[:card_id])
    @comment = @card.comments.build(comment_params)

    if @comment.save
      redirect_to "", notice: "Comment made!"
    else
      flash[:error] = "Comment could not be made!"
      redirect_to ""
    end

    def destroy
      @comment.destroy
    end
  end

  private
  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
