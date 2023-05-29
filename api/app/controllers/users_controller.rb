class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :invalid_user
  wrap_parameters format: []

  skip_before_action :authorization, only: [:create, :destroy, :index]

  def index
    user = User.all
    decode_token
    render json: user, status: :ok
  end

  def create
    user = User.create!(users_permit)
    if user.valid?
      token = encode_token(user_id: user.id)
      render json: {user: UserSerializer.new(user), jwt_token: token}, status: :created
    else
      render json: {error: "Wrong credentials"}, status: :unprocessable_entity
    end
  end

  def show
    user = User.find_by(id: params[:id])
    render json: user
  end

  def destroy
    user = User.find_by(id: params[:id])
    user.delete
    head :no_content
  end

  private

  def users_permit
    params.permit(:username, :password, :email)
  end

  def invalid_user invalid
    render json: {error: invalid.record.errors.full_messages}, status: :unprocessable_entity
  end
end
