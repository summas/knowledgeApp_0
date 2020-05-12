class GroupsController < ApplicationController
  before_action :setLayout
  layout 'article'
 
  def index
    @data = Group.all
  end

  def add
    @group = Group.new
    if request.post? then
      @group = Group.create group_params
      redirect_to '/groups'
    end
  end

  def edit
    @group = Group.find params[:id]
    if request.patch? then
      @group.update group_params
      redirect_to '/groups'
    end
  end

  def delete
    @group = Group.find params[:id]
    @group.destroy
    Article.where(group_id: params[:id]).update(group_id: '０')
    redirect_to '/groups'
  end

  def setLayout
    @account = current_account
    @articleconfig = SiteConfig.find 1
    @groups = Group.all
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
