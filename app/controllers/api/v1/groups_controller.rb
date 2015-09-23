class Api::V1::GroupsController < ApplicationController

  def show
    group = Group.find(params[:id])
    topics = Topic.where(group_id: group.id)
    render json: { "group" => group, "topics" => topics }
  end

end
