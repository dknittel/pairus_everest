class LoginController < ApplicationController

  def login
    sign_in(:user, User.find(params[:id]))
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
    @topic = group.topics.create(params[:title])

    # this should send back all topics with newly created topic
  end

  private

    def topic_params
      params.require(:group).permit(:title)
    end
end
