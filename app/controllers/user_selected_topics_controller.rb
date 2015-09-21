class UserSelectedTopicsController < ApplicationController

  def create
    user = current_user
    p params
    group = Group.find(params[:group])
    topics = params[:topic].keys
    topics.each do |topic|
      user.user_selected_topics << UserSelectedTopic.create(user_id: user.id, topic_id: topic)
    end
    p user.user_selected_topics
     redirect_to group_availabilities_path(group.id)
  end
end
