class Api::V1::TopicsController < ApplicationController

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
