class HoursController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def create
<<<<<<< HEAD
    p params
=======
    hours = []

    7.times do |num|
        current_day = Time.now.day.to_i
        current_day = (current_day.to_i + num)

        if params["#{current_day}"] != nil
          time_array = params["#{current_day}"]

          time_array.each do |hour|
            current_user.hours.create(day: current_day.to_i, hr: hour)
          end
        end

      user_group = UserGroup.find_by(user_id: current_user.id)
      @group = Group.find(user_group.group_id)
    end
      redirect_to group_path(@group)

    # usts = current_user.user_selected_topics

    # hours.each do |hour|
    # end
>>>>>>> d1437565f6b28c50ae5b568427bea2e2a04ae0b0
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
