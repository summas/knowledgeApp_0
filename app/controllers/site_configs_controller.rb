class SiteConfigsController < ApplicationController
  layout 'article'

  def index
    @articleconfig = SiteConfig.find 1
    @categories = Category.all
  end

  def edit
    @articleconfig = SiteConfig.find 1
    @articleconfig.update siteconfig_params if request.patch?
  end

  private
  def siteconfig_params
    params.require(:site_config).permit(:title, :subtitle, :style)
  end
end
