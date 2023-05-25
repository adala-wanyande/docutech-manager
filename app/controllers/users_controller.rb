class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_user, only: [:show, :update, :destroy]
  
    def index
      users = User.all
      render json: users, each_serializer: UserSerializer
    end
  
    def show
      render json: user, serializer: UserSerializer
    end
  
    def create
      user = User.create!(user_params)
      if user.save
        render json: user, status: :created, serializer: UserSerializer
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if user.update!(user_params)
        render json: user, serializer: UserSerializer
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      user.destroy
      head :no_content
    end
  
    private

    def render_not_found_response
        render json: { error: "user not found" }, status: :not_found
    end
  
    def set_user
      user = User.find(params[:id])
    end
  
    def user_params
      params.require(:user).permit(:name, :email, :password, :role)
    end
  end
  