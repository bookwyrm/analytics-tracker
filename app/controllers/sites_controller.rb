class SitesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  respond_to :html, :json

  def new
    @site = Site.new
    respond_with(@site)
  end

  def create
    @site = Site.new(site_params)
    @site.save
    respond_with(@site)
  end

  def show
    respond_with(@site)
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
