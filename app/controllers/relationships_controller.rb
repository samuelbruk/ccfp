class RelationshipsController < ApplicationController

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
      render json: {message: 'Collaborator added'}
    else
      render json: {message: 'Something went wrong'}
    end
  end

end
