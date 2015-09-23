class PagesController < ApplicationController
  def home
    @group_id = params[:group]
  	if user_signed_in?
      p '*' * 100
      p session[:group_id]
      if session[:group_id] != ""
        group_id = session[:group_id]
        group = Group.find(group_id)
        group.users << current_user
      end
  		redirect_to groups_path
  	end
  end
end
