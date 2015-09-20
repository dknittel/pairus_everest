class PagesController < ApplicationController
  def home
  	if user_signed_in?
  		redirect_to new_group_path
  	end
  end
end
