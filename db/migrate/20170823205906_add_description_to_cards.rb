class AddDescriptionToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :description, :string, after: :name
  end
end
