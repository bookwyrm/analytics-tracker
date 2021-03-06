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
    respond_with(@site)
  end

  private
    def set_site
      @site = current_user.account.sites.find(params[:id])
    end

    def site_params
      params.require(:site).permit(:domain_name)
    end
end
