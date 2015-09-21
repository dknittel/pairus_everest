class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def index
    @group = Group.find(params[:group_id])
    user_groups = UserGroup.where(group_id: @group.id)
    @users = []
    user_groups.each do |user_group|
      if user_group.user_id != current_user.id
        @users << User.find(user_group.user_id)
      end
    end

    current_user_selected_topics = UserSelectedTopic.where(user_id: current_user.id)
    current_user_availabilities = []

    current_user_selected_topics.each do |cust|
      cust.availabilities.each do |avail|
        current_user_availabilities << avail
      end
    end
    # current_user_topics = []
    # current_user_selected_topics.each do |cust|
    #   current_user_topics << Topic.find(cust.topic_id)
    # end
    usts = []
    @users.each do |user|
      current_user_selected_topics.each do |cust|
        UserSelectedTopic.where(user_id: user.id).each do |ust|
          if ust.topic_id == cust.topic_id
            usts << ust
          end
        end
      end
    end

    availabilities = []
    usts.each do |ust|
        ust.availabilities.each do |avail|
          availabilities << avail
        end
    end
    p "*" * 80
    p availabilities
    p "*" * 80


    @possible_availability_matches = []
    availabilities.each do |avail|
      current_user_availabilities.each do |current_avail|
        if avail.hour_id == current_avail.hour_id
          @possible_availability_matches << avail
        end
      end
    end
    @possible_availability_matches
    render :index
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
