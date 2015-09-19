class GroupsController < ApplicationController
  def create
  end

  def update
  end

  def destroy
  end

  def index
    #need a page to show all of a user's groups
    #user = some devise shit
    user_groups = UserGroup.where(user_id: user.id)
    @groups = []
    user_groups.each do |user_group|
      @groups << Group.find(user_group.id)
    end
  end

  def show
    @group = Group.find(params[:id])
    @topics = Topic.where(group_id: @group.id)
  end

  def new
  end
end
