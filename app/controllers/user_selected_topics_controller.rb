class UserSelectedTopicsController < ApplicationController

  def create
    user = current_user
    group = Group.find(params[:group])
    if params[:topic]
      topics = params[:topic].keys
      topics.each do |topic|
        user.user_selected_topics << UserSelectedTopic.create(user_id: user.id, topic_id: topic)
      end
      user.user_selected_topics.each do |ust|
        p params[:topic].include?(ust.topic_id.to_s)
        if params[:topic].include?(ust.topic_id.to_s)
          ust.selected = true
          ust.save
        else
          ust.selected = false
          ust.save
        end
      end

      user.user_selected_topics.each do |ust|
        user.hours.each do |hour|
          if !Availability.exists?(user_selected_topic_id: ust.id, hour_id: hour.id)
            Availability.create(user_selected_topic_id: ust.id, hour_id: hour.id)
          end
        end
      end
      redirect_to group_availabilities_path(group.id)
    else
      redirect_to group_path(group.id)
    end
  end
end
