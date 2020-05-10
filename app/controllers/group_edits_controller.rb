class GroupEditsController < ApplicationController
  before_action :setLayout
  require_relative './lib/Util.rb'

  def index
    @util = Util.new
    groupIds = GroupRelation.where('account_id = ?', params[:id]).pluck("group_id")
   # @groups = @util.get_group_hash(Group.all)
   @groups = Group.where(id:groupIds)
    @accountName = Account.select('name').find(params[:id])
    @groupRelation = GroupRelation.where('account_id = ?', params[:id]).order('group_id')
    
    @groupRelationAdd = GroupRelation.new
  end

  def add
    @groupRelation = GroupRelation.new
    if request.post? then
      @groupRelation = GroupRelation.create group_params
      redirect_to '/group_edits/index/#{params[:id]}'
    end
  end

  def edit
    # if params[:id].present? then
    #  @groups = Group.find params[:id]　@groups[obj.group_id.to_s]
    @groupRelation = GroupRelation.where(account_id:params[:id])
    if @groupRelation.blank? then
      @groupRelation = GroupRelation.new
    end
    if request.patch? then
      @groups.update group_params
      redirect_to '/admins/group_edit'
    end
  end

  def delete
    @groupRelation = GroupRelation.find params[:id]
    @groupRelation.destroy
    redirect_to '/admins/index'
  end

  def setLayout
    @account = current_account
    @articleconfig = SiteConfig.find 1
    @categories = Category.all
  end

  private

  def group_params
    params.require(:group_relation).permit(:group_id, :account_id)
  end
end
