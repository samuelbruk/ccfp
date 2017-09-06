class ChangeColumnDescriptionCards < ActiveRecord::Migration[5.1]
  def change
    change_column :cards, :description, :text
  end
end
