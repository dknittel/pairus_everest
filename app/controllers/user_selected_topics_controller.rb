class UserSelectedTopicsController < ApplicationController

  def create
    user = current_user
    p params
    group = Group.find(params[:group])
    if params[:topic]
      topics = params[:topic].keys
      topics.each do |topic|
        user.user_selected_topics << UserSelectedTopic.create(user_id: user.id, topic_id: topic)
      end
      user.user_selected_topics.each do |ust|
        ust.availabilities.each do |avail|
          # avail.each do |a|
          avail.destroy
          p '*' * 100
          p avail
          # end
          # avail.destroy
        end
      end

      user.user_selected_topics.each do |ust|
        user.hours.each do |hour|
          # if !Availability.exists?(user_selected_topic_id: ust.id, hour_id: hour.id)
            Availability.create(user_selected_topic_id: ust.id, hour_id: hour.id)
          # end
        end
      end
      redirect_to group_availabilities_path(group.id)
    else
      redirect_to group_path(group.id)
    end
  end
end
