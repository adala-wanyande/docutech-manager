class AuthController < ApplicationController

  skip_before_action :authorization, only: [:create]

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      token = encode_token(user_id: user.id)
      render json: user
    else
      render json: {error: "bad credentials"}
    end
  end
end
