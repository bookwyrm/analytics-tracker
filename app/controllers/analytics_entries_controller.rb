class AnalyticsEntriesController < ApplicationController
  def track_entry
    account = Account.find(params[:account_id])
    site = Site.find(params[:site_id])
    Octopus.using(ShardingHelper.shard_symbol_for_key account.sharding_key) do
      @entry = AnalyticsEntry.new( { user_agent: request.user_agent, url: request.referer, site_id: site.id } )
      @entry.save
    end
    render plain: @entry.inspect
  end
end
