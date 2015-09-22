class LoginController < ApplicationController

  def login
    sign_in(:user, User.find(params[:id]))
    render json: response
  end

end

class GroupsController < ApplicationController

  def show
    group = Group.find_by(params[:id])
    topics = Topic.where(group_id: group.id)
    render json: { "group" => group, "topics" => topics }
  end

end

class UserSelectedTopicsController < ApplicationController

  def index
    user = User.find(params[:id])
    selected_topics = user.user_selected_topics
    render json: { "selected_topics" => selected_topics }
  end

  def create
    @user_selected_topic1 = UserSelectedTopic.create(params[:title])
    @user_selected_topic2 = UserSelectedTopic.create(params[:title2])
    @user_selected_topic3 = UserSelectedTopic.create(params[:title3])
    @user_selected_topic4 = UserSelectedTopic.create(params[:title4])
    @user_selected_topic5 = UserSelectedTopic.create(params[:title5])

    # after all records are saved this should render all selected topics

  end

  private

    def topic_params
      params.require(:group).permit(:title, :title2, :title3, :title4, :title5 )
    end
end



class TopicsController < ApplicationController

  def create
    group = Group.find(params[:group_id])
    topic = group.topics.create(params[:title])

    # this should send back all topics with newly created topic
    topics = group.topics
    render json: topics
  end

  private

    def topic_params
      params.require(:group).permit(:title)
    end
end

class NotificationsController < ApplicationController

  def index

    @group = Group.find(params[:group_id])
    user_groups = UserGroup.where(group_id: @group.id)
    @users = []
    user_groups.each do |user_group|
      if user_group.user_id != current_user.id
        @users << User.find(user_group.user_id)
      end
    end

    current_user_selected_topics = UserSelectedTopic.where(user_id: current_user.id, selected: true)
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
    p 'qqqqqqqqqqqqqqqqqqqq'
    p usts

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
        if Hour.find(avail.hour_id).day == Hour.find(current_avail.hour_id).day && Hour.find(avail.hour_id).hr == Hour.find(current_avail.hour_id).hr
          # find PotentialPair for the current_avail && avail check to see if accped is false for either user.
          if(PotentialPair.exists?(availability1_id: current_avail.id, availability2_id: avail.id))
            pp = PotentialPair.find_by(availability1_id: current_avail.id, availability2_id: avail.id)
            current_avail_1_or_2 = 1
          elsif
            (PotentialPair.exists?(availability1_id: avail.id, availability2_id: current_avail.id))
            pp = PotentialPair.find_by(availability1_id: avail.id, availability2_id: current_avail.id)
            current_avail_1_or_2 = 2
          else
            pp = nil
          end
          if pp == nil
            @possible_availability_matches << avail
          else
            if (pp.user1_accepted != false && pp.user2_accepted != false) && (pp.user1_accepted != true || pp.user2_accepted != true)
              #check if this user accepted it:
              if !(current_avail_1_or_2 == 1 && pp.user1_accepted == true)
                if !(current_avail_1_or_2 == 2 && pp.user2_accepted == true)
                  @possible_availability_matches << avail
                end
              end
            end
          end

        end
      end
    end
    p 'aaaaaaaaaaaaaaaaaaaaaaaaaaa'
    @possible_availability_matches = @possible_availability_matches.uniq
    @current_user = current_user

  end
  render json: @possible_availability_matches
end
