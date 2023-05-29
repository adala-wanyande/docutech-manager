class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :handle_record_invalid
    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, serializer: UserSerializer, status: :created
      end

      def index
        users = User.all
        render json: users
      end

  
      def show
        if logged_in?
          user = User.find(session[:user_id])
          render json: user, serializer: UserSerializer, status: :created
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end

      def update
        if logged_in?
          user = User.find(session[:user_id])
          if user.update(user_update_params)
            render json: user, serializer: UserSerializer, status: :ok
          else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
          end
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end

      def destroy
        if logged_in?
          user = User.find(session[:user_id])
          user.destroy
          render json: { message: 'User deleted successfully' }, status: :ok
        else
          render json: { error: 'Unauthorized' }, status: :unauthorized
        end
      end
    
      private

      def handle_record_invalid(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
      end

      def logged_in?
        session[:user_id].present?
      end
    
      def user_params
        params.permit(:username, :password, :password_confirmation, :email, :role)
      end

      def user_update_params
        params.permit(:username, :password, :email, :role)
      end


end
