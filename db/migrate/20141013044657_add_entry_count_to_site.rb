class AddEntryCountToSite < ActiveRecord::Migration
  def change
    add_column :sites, :entry_count, :integer, default: 0
  end
end
