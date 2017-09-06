class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, only: [:destroy]

  def create
    @card = Card.find(params[:card_id])
    @comment = @card.comments.build(comment_params)

    if @comment.save
      respond_to do |format|
        format.js { render :create}
      end
    end
  end

  def destroy
    @comment.destroy
  end

  private
  def find_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
