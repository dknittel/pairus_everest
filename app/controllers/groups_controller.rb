class GroupsController < ApplicationController
  before_action :authenticate_user!
  def create
    # create the group
    group = Group.create(group_params)

    # make the current user the groups admin
    group.admin_id = current_user.id
    
    # save the group
    if group.save

    # if saved then shovel the group into current users user_groups
    current_user.user_groups.create(group: group, user: current_user)
    redirect_to new_group_topic_path(group)
    else
      render :new
    end
  end

  def invites
    @group = Group.find(params[:group_id])
  end

  def update
  end

  def destroy
  end

  def index
    @groups = []
    user_groups = current_user.user_groups
    user_groups.each do |user_group|
      @groups << Group.find(user_group.group_id)
    end
  end

  def show
    @group = Group.find(params[:id])
    @topics = @group.topics
  end

  def new
    @group = Group.new
  end

private
  def group_params
    params.require(:group).permit(:name)
  end
end
