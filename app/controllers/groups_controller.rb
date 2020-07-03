class GroupsController < ApplicationController
  layout 'article'
  before_action :authenticate_account!, only:[:index,:add,:edit,:delete,:edit]
 
  def index
    @group = Group.new
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

  def stop
    @group = Group.find params[:id]
    if request.patch? then
      @group.update(del_flg: DelFlg::STOP)
      redirect_to '/groups'
    end
  end

  def restart
    @group = Group.find params[:id]
    if request.patch? then
      @group.update(del_flg: DelFlg::START)
      redirect_to '/groups'
    end
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end
