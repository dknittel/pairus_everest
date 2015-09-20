class UserSelectedTopicsController < ApplicationController
  def create
    user = User.find(current_user.id)
    topics = params[:topic].keys
    topics.each do |topic|
    user.user_selected_topics << topic.id
    end
  end
end
