class PagesController < ApplicationController
  def home
    @group_id = params[:group]
  	if user_signed_in?
      unless session[:group_id] == "" || session[:group_id].nil?
        group_id = session[:group_id]
        group = Group.find(group_id)
        group.users << current_user
      end
  		redirect_to groups_path
  	end
  end
end
