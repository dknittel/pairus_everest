class PagesController < ApplicationController
  def home
    if session[:user_id]
      @groups = []
      user = User.find(current_user.id)
      user_groups = user.user_groups
      user_groups.each do |user_group|
        @groups << Group.find(user_group.group_id)
      end
      @groups = user.groups
    end
  end
end
