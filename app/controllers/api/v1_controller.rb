class Api::V1Controller < ApplicationController

  before_action :authenticate_user!

  private

  def authenticate_user!
    authenticate_with_http_basic do |email, password|
      user = User.where(email:email).first
      sign_in user if user && user.valid_password?(password)
    end
    if current_user.nil?
      render json:{error:'Unauthorized'}, status: :forbidden
    end
  end

end
