class AddDeadLineToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :dead_line, :datetime
  end
end
