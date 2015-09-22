class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!

  def new
  end

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
    p '8' * 100
    p current_user_availabilities.count
    p current_user_availabilities.uniq.count
    #these are unique
    p '8' * 100
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
    p availabilities.count
    p availabilities.uniq.count
    #these are all unique
    p "*" * 80


    @possible_availability_matches = []
    availabilities.each do |avail|
      current_user_availabilities.each do |current_avail|
        if Hour.find(avail.hour_id).day == Hour.find(current_avail.hour_id).day && Hour.find(avail.hour_id).hr == Hour.find(current_avail.hour_id).hr && Hour.find(avail.hour_id).month == Hour.find(current_avail.hour_id).month && UserSelectedTopic.find(avail.user_selected_topic_id).topic_id == UserSelectedTopic.find(current_avail.user_selected_topic_id).topic_id
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
    p @possible_availability_matches.count
    p @possible_availability_matches.uniq.count
    #now these are unique
    @possible_availability_matches = @possible_availability_matches.uniq
    @current_user = current_user

  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

end
