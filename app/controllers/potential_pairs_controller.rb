class PotentialPairsController < ApplicationController
  def index
    group = Group.find(params[:group_id])
    redirect_to group_path(group)
  end

  def show
  end

  def new
  end

  def create
    group = Group.find(params[:group_id])
    p '*' * 100
    PotentialPair.create()
    redirect_to group_path(group)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
