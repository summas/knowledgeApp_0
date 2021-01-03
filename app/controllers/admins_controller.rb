class AdminsController < ApplicationController
  before_action :authenticate_account!, only:[:menu,:index,:add,:edit,:delete,:edit]
  layout 'article'
  require_relative './lib/util.rb'

  def menu
  end

  def index
    @accounts = Account.all.order('created_at desc')
  end

  def add
    @auth_select = AuthSelect::ADMIN
    @editAccount = Account.new
    if request.post? then
      @editAccount = Account.create account_params
      redirect_to '/admins/index'
    end
  end

  def edit
    @util = Util.new
    @editAccount = Account.find params[:id]
    @pass = params.to_unsafe_h["account"].to_h["password"]
    if request.patch? then
      if @pass.blank? then #仮記載、後でpasswordの中身が空かどうかと長さをチェックする
        @editAccount.update account_params2
      else
        @editAccount.update account_params
      end
      redirect_to '/admins/index'
    end
  end

  def delete
    @delAccount = Account.find params[:id]
    @delAccount.destroy
    redirect_to '/admins/index'
  end

  def group_edit
    @util = Util.new
    @edit_account = Account.select('id', 'name').find(params[:id])
    @groupRelation = GroupRelation.select('id','group_id').where('account_id = ?', params[:id]).order('group_id')
    groupIds = GroupRelation.where('account_id = ?', params[:id]).pluck("group_id")
    @addGroups = @util.get_model_hash(Group.where.not(id:groupIds))
    @groupRelationAdd = GroupRelation.new
  end

  private
  def account_params
    params.require(:account).permit(:name, :auth, :organization, :email, :password)
  end

  def account_params2
    params.require(:account).permit(:name, :auth, :organization, :email)
  end
end
