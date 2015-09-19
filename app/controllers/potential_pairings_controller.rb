class PotentialPairingsController < ApplicationController
  def index
    #user = devise shit
    user_selected_topics = UserSelectedTopic.where(user_id: user.id)
    availabilities = []
    user_selected_topics.each do |user_selected_topic|
      Availability.where(user_selected_topic_id: user_selected_topic.id).each do |availability|
        availabilities << availability
      end
    end
    @potential_pairs = []
    availabilities.each do |availability|
      #check where+or syntax:
      PotentialPair.where(availability1_id: availability.id OR availability2_id: availability.id).each do |potential_pair|
        @potential_pairs << potential_pair
      end
    end
    #the following is all just to get the list of users in that group
    topic = Topic.find(user_selected_topic.topic_id)
    group = Group.find(topic.group_id)
    user_groups = UserGroup.where(group_id: group.id)
    @users = []
    user_groups.each do |user_group|
      @users << User.find(user_group.user_id)
    end
  end

  def show
  end

  def new
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
