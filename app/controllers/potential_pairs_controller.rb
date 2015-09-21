class PotentialPairsController < ApplicationController
  def index
    group = Group.find(params[:group_id])
    redirect_to group_path(group)
    # this is where the Pairing list should be displayed from
    # if PotentialPair.user1_accepted == "true" || PotentialPair.user2_accepted == "true"
    # display the PotentialPair info
    # end
  end

  def show
  end

  def new
  end

  def create
    # if PotentialPair exist with same topic, hour, and both users
    # then do not create but update
    # else if PotentialPair doesn't exist create one
    current_avail = Availability.find_by(user_selected_topic_id: UserSelectedTopic.find_by(user_id: current_user.id), hour_id: Hour.find_by(hr: params[:time][:hour]))
    # User.find()
    pair_user = User.find(params[:user_id])
    group = Group.find(params[:group_id])
    p '*' * 100
    p current_avail.id
    p params
    if !(PotentialPair.exists?(availability1_id: current_avail.id, availability2_id: params[:avail]))
      if params[:accepted]
        PotentialPair.create(availability1_id: current_avail.id, availability2_id: params[:avail], user1_accepted: true, user2_accepted: nil)
      else
        PotentialPair.create(availability1_id: current_avail.id, availability2_id: params[:avail], user1_accepted: false, user2_accepted: nil)
      end
    else
      if params[:accepted]
        pp = PotentialPair.find_by(availability1_id: current_avail.id, availability2_id: params[:avail])
        pp.user2_accepted = true
        pp.save
      else
        pp = PotentialPair.find_by(availability1_id: current_avail.id, availability2_id: params[:avail])
        pp.user2_accepted = false
        pp.save
      end
    end
    redirect_to group_path(group)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
