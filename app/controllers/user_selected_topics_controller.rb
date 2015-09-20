class UserSelectedTopicsController < ApplicationController

  def create
    user = current_user
    p "*" * 80
     p current_user
     p "*" * 80
     p params[:topic]
     p "*" * 80

    topics = params[:topic].keys
    topics.each do |topic|
      user.user_selected_topics << UserSelectedTopic.create(user_id: user.id, topic_id: topic)
    end
    p user.user_selected_topics
    # redirect_to
  end
end
