class AdminsController < ApplicationController
  before_action :authenticate_account!, only:[:menu]
  def menu
  end

  def index
  end

  def add
  end

  def edit
  end

  def delete
  end
end
