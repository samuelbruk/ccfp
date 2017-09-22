class RelationshipsController < ApplicationController
  before_action :find_relationship, only: :destroy

  def create
    # we need to check if the user actually owns the board first TODO
    user_id = current_user.id
    connection_id = params[:connection_id]
    board_id = params[:board_id]
    relationship = Relationship.new(
      user_id: user_id,
      connection_id: connection_id,
      board_id: board_id
    )
    # puts "Just added #{user_id}, #{connection_id} and #{board_id}"
    if relationship.save
      render json: {relationship_id: relationship.id, message: 'Collaborator added'}
    else
      render json: {relationship_id: '', message: 'Something went wrong'}
    end
  end

  def destroy
    # first we need to check if the user owns the relationship TODO
    if @relationship.destroy
      render json: {message: 'Relationship deleted'}
    else
      render json: {message: 'Something went wrong when deleting'}
    end
  end

  private
  def find_relationship
    @relationship = Relationship.find(params[:id])
  end
end
