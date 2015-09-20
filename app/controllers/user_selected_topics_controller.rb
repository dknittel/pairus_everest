class UserSelectedTopicsController < ApplicationController
  def create
    p params
    user = User.find(current_user.id)
    user.user_selected_topics << params[]
    we need to create a user_selected topic with the user id
  end
end
