class ChangeIdFormatInAccount < ActiveRecord::Migration
  def change
    change_column :accounts, :id, :bigint
  end
end
