class Site < ActiveRecord::Base
  belongs_to :account
  has_many :analytics_entries

  def entries
    AnalyticsEntry.using(ShardingHelper.shard_symbol_for_key account.sharding_key).where(site: self)
  end
end
