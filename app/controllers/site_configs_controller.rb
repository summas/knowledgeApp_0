class SiteConfigsController < ApplicationController
  layout 'article'

  def index
    @articleconfig = SiteConfig.find 1
    @categories = Category.all
  end

  def edit
    @articleconfig = SiteConfig.find 1
    if request.patch? then
      @articleconfig.update siteconfig_params
      redirect_to '/site_configs'
    end
  end

  private
  def siteconfig_params
    params.require(:site_config).permit(:title, :subtitle, :style)
  end
end
