class AnalyticsEntriesController < ApplicationController

  def track_entry
    account = Account.find(params[:account_id])
    site = Site.find(params[:site_id])
    @entry = AnalyticsEntry.new( { user_agent: request.user_agent, url: request.referer, site_id: site.id } )
    Octopus.using(:shard_2) do
      @entry.save
    end
    render plain: @entry.inspect
  end
end
