class GroupEditsController < ApplicationController
  require_relative './lib/util.rb'

  def index
    @util = Util.new
    @accountName = Account.select('name').find(params[:id])
    @groupRelation = GroupRelation.select('id','group_id').where('account_id = ?', params[:id]).order('group_id')
    groupIds = GroupRelation.where('account_id = ?', params[:id]).pluck("group_id")
    @addGroups = @util.get_model_hash(Group.where.not(id:groupIds))
    @groupRelationAdd = GroupRelation.new
  end

  def add
 #   @groupRelation = GroupRelation.new
    if request.post? then
      @groupRelation = GroupRelation.create group_params
      redirect_to '/group_edits/index/1' #+ params[:account_id]
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
    redirect_to '/group_edits/index/' + @groupRelation.account_id.to_s
  end

  private

  def group_params
    params.require(:group_relation).permit(:group_id, :account_id)
  end
end
