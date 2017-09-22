class AddBoardIdToRelations < ActiveRecord::Migration[5.1]
  def change
    add_reference :relationships, :board, foreign_key: true, index: true
  end
end
