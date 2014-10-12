class ChangeShardingKeyFormatInAccount < ActiveRecord::Migration
  def change
    change_column :accounts, :sharding_key, :bigint
  end
end
