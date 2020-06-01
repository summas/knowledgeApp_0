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
   # if params[:id].present? then
    #  @groups = Group.find params[:id]
    @groupRelation = GroupRelation.where(account_id:params[:id])
    if @groupRelation.blank? then
       @groupRelation = GroupRelation.new
    end
    if request.patch? then
      @groups.update group_params
      redirect_to '/admins/group_edit'
    end
  end

  def group_add
    puts params
    @groupRelation = GroupRelation.new
    if request.post? then
      @groupRelation = GroupRelation.create group_params
      redirect_to '/admins/groupEdit/3' #+ params[:id]
    end
  end

  private
  def account_params
    params.require(:account).permit(:name, :auth, :organization, :email, :password)
  end

  def account_params2
    params.require(:account).permit(:name, :auth, :organization, :email)
  end
end
