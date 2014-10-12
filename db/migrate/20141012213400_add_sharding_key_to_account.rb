class AddShardingKeyToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :sharding_key, :integer
  end
end
