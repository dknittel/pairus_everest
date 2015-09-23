class LoginController < ApplicationController
  def login
    @user = {user:"erick", email: "e.gist2@gmail.com"}
    render json: @user
  end
end
