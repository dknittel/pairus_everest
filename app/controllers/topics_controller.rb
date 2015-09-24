class TopicsController < ApplicationController
  def index
    # @group = Group.where
  end

  def show
  end

  def new
    @topic = Topic.new
    @group = Group.find(params[:group_id])
  end

  def create
    group = Group.find(params[:group_id])
    topic = group.topics.create(title: params[:topic][:title])
    if group.topics.length < 1 && topic.save
      redirect_to "/groups/#{group.id}/invites"
    elsif group.topics.length >= 1 && topic.save
      redirect_to "/groups/#{group.id}"
    else
      render :new
    end
  end

  def destroy
    topic = Topic.find(params[:id])
    topic.destroy
    redirect_to "/groups/#{params[:group_id]}"
  end
end
