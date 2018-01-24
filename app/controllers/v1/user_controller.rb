class V1::UserController < ApplicationController
  before_action :authenticate_user

  def identify
    render json: current_user
  end
end
