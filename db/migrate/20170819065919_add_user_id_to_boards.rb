class AddUserIdToBoards < ActiveRecord::Migration[5.1]
  def change
    add_reference :boards, :user, foreign_key: true, index: true
  end
end
