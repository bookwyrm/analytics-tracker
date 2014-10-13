class SitesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def new
    @site = Site.new
    respond_with(@site)
  end

  def index
    @sites = current_user.account.sites
  end

  def create
    @site = Site.new(site_params)
    @site.account = current_user.account
    @site.save
    respond_with(@site)
  end

  def show
    @entries = AnalyticsEntry.using(ShardingHelper.shard_symbol_for_key @site.account.sharding_key).where(site: @site)
    respond_with(@site, @entries)
  end

  private
    def set_site
      # TODO set scoping for user/account
      @site = Site.find(params[:id])
    end

    def site_params
      params.require(:site).permit(:domain_name)
    end
end
