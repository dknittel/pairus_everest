class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def index
    group = Group.find(params[:group_id])
    user_groups = UserGroup.where(group_id: group.id)
    @users = []
    user_groups.each do |user_group|
      @users << User.find(user_group.user_id)
    end
    current_user_selected_topics = UserSelectedTopic.where(user_id: current_user.id)
    current_user_topics = []
    current_user_selected_topics.each do |cust|
      current_user_topics << Topic.find(cust.topic_id)
    end
    usts = []
    @users.each do |user|
      current_user_topics.each do |cust|
        if UserSelectedTopic.where(user_id: user.id).topic_id == cust.id
          usts << UserSelectedTopic.where(user_id: user.id)
        end
      end
    end
    @availabilities = []
    usts.each do |ust_array|
      ust_array.each do |ust|
        @availabilities << Availability.where(user_selected_topic_id: ust.id)
      end
    end
    possible_availability_matches = []
    @availabilities.each do |avail|

    end
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
