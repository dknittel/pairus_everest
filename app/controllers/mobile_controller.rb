class MobileController < ApplicationController

  def login
    p params
    render json: params
  end

end
