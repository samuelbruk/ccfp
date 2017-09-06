class ChangeIsCheckedDefaultOfChecklists < ActiveRecord::Migration[5.1]
  def change
    change_column_default :checklists, :is_checked, false
  end
end
