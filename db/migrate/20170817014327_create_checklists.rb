class CreateChecklists < ActiveRecord::Migration[5.1]
  def change
    create_table :checklists do |t|
      t.text :content
      t.boolean :is_checked
      t.belongs_to :card, foreign_key: true

      t.timestamps
    end
  end
end
