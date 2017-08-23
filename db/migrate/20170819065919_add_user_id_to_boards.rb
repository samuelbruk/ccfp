class AddUserIdToBoards < ActiveRecord::Migration[5.1]
  def change
    add_reference :f, :user, foreign_key: true, index: true
  end
end
