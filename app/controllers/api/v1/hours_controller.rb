class Api::V1::HoursController < Api::V1Controller

  before_action :authenticate_user!

  def index
    render json: current_user.hours
  end

  def new
  end

  def create
    hours = []
    month = Time.now.month
    7.times do |num|
        current_day = Time.now.day.to_i
        current_day = (current_day.to_i + num)

        if params["#{current_day}"] != nil
          time_array = params["#{current_day}"]

          time_array.each do |hour|
            if !current_user.hours.exists?(day: current_day.to_i, hr: hour, month: month)
              current_user.hours.create(day: current_day.to_i, hr: hour, month: month)
            end
          end
        end

      if current_user.groups.count > 1
      user_group = UserGroup.find_by(user_id: current_user.id)
      @group = Group.find(user_group.group_id)
      end
    end
      redirect_to root_path
  end

  def edit
  end

  def update
  end

  def destroy
    hour = Hour.find(params[:id])
    hour.destroy
    redirect_to "/groups"
  end
end
