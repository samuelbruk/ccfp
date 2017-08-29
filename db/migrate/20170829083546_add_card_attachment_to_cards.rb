class AddCardAttachmentToCards < ActiveRecord::Migration[5.1]
  def change
    add_column :cards, :card_attachment, :string
  end
end
