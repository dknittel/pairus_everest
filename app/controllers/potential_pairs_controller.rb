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
    a = Availability.find(params[:avail])
    ust = UserSelectedTopic.find(a.user_selected_topic_id)
    user2 = User.find(ust.user_id)
    topic = Topic.find(ust.topic_id)
    current_avail = Availability.find_by(user_selected_topic_id: UserSelectedTopic.find_by(user_id: current_user.id, topic_id: topic.id).id, hour_id: Hour.find_by(hr: params[:time][:hour], user_id: current_user.id).id)

    pair_user = User.find(params[:user_id])
    group = Group.find(params[:group_id])

    if !(PotentialPair.exists?(availability1_id: current_avail.id, availability2_id: params[:avail])) && !(PotentialPair.exists?(availability2_id: current_avail.id, availability1_id: params[:avail]))
      p params[:accepted]
      if params[:accepted] == "true"
        PotentialPair.create(availability1_id: current_avail.id, availability2_id: params[:avail], user1_accepted: true, user2_accepted: nil)
      else
        PotentialPair.create(availability1_id: current_avail.id, availability2_id: params[:avail], user1_accepted: false, user2_accepted: nil)
      end
  elsif (PotentialPair.exists?(availability1_id: current_avail.id, availability2_id: params[:avail]))
    if params[:accepted] == "true"
      pp = PotentialPair.find_by(availability1_id: current_avail.id, availability2_id: params[:avail])
      pp.user2_accepted = true
      pp.save
      UserMailer.pair_email(current_user, user2, topic, params[:time]).deliver_now
      UserMailer.pair_email(user2, current_user, topic, params[:time]).deliver_now
      Hour.find(current_avail.hour_id).destroy
      Hour.find(a.hour_id).destroy
    else
      pp = PotentialPair.find_by(availability1_id: current_avail.id, availability2_id: params[:avail])
      pp.user2_accepted = false
      pp.save
    end
  else
    if params[:accepted] == "true"
      pp = PotentialPair.find_by(availability2_id: current_avail.id, availability1_id: params[:avail])
      pp.user2_accepted = true
      pp.save
      UserMailer.pair_email(current_user, user2, topic, params[:time]).deliver_now
      UserMailer.pair_email(user2, current_user, topic, params[:time]).deliver_now
      Hour.find(current_avail.hour_id).destroy
      Hour.find(a.hour_id).destroy
    else
      pp = PotentialPair.find_by(availability2_id: current_avail.id, availability1_id: params[:avail])
      pp.user2_accepted = false
      pp.save
    end

  end
  redirect_to group_availabilities_path(group)
end

def edit
end

def update
end

def destroy
end
end
