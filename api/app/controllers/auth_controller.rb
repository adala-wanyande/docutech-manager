class AuthController < ApplicationController
  skip_before_action :authorization, only: [:create, :show]
  include ApplicationHelper


  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      token = encode_token(user_id: user.id)
      render json: {message: "success"}, status: :created
    else
      render json: {error: "bad credentials"}, status: :unprocessable_entity
    end
  end
  # def destroy
  #   decode_token
  #   if decode_token
  #     user_id = decode_token [0]['user_id']
  #     user = User.find_by(id: user_id)
  #     user.delete
  #     render json: {message: "logout successful"}
  #   else
  #   end
  # end
  def show
    render json: { user: current_user }, status: :accepted
  end
end
