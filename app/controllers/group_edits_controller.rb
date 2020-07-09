class GroupEditsController < ApplicationController
  require "#{Rails.root}/config/initializers/constants.rb"
  before_action :authenticate_account!, only:[:index,:add,:edit,:delete,:edit]

  def index
    @util = Util.new
    @accountName = Account.select('name').find(params[:id])
    @groupRelation = GroupRelation.select('id','group_id').where('account_id = ?', params[:id]).order('group_id')
    groupIds = GroupRelation.where('account_id = ?', params[:id]).pluck("group_id")
    @addGroups = @util.get_model_hash(Group.where.not(id:groupIds))
    @groupRelationAdd = GroupRelation.new
  end

  def add
    if request.post? then
      @groupRelation = GroupRelation.create group_params
      redirect_to '/admins/groupEdit/' + params[:group_relation][:account_id]
    end
  end

  def delete
    @groupRelation = GroupRelation.find params[:g_reration_id]
    @groupRelation.destroy
    redirect_to '/admins/groupEdit/' + params[:account_id]
  end

  private

  def group_params
    params.require(:group_relation).permit(:group_id, :account_id)
  end
end
