class UsersController < ApplicationController
# before_action :session_expired?, only: [:show]
before_action :verify_auth, only: [:show]

def register
    user = User.create(user_params)
    if user.valid?
        save_user(user.id)
        app_response(message: "registration was successfull", data: user, status: :created)
    else 
        app_response(message: "something went wrong during registration", status: :unprocessable_entity, data:user.errors)
    end
end

def login
    sql = "username = :username OR email = :email"
    user = User.where(sql, { username: user_params[:username], email: user_params[:email] }).first
    if user&.authenticate(user_params[:password])
        save_user(user.id)
        token = encode(user.id)
        app_response(message: 'Login was successful', status: :ok, data: {user: user, token: token})
    else
        app_response(message: 'Invalid username/email or password', status: :unauthorized)
    end
end

def logout
    remove_user
    app_response(message: 'Logout successful')
end

# autologin
def show
    # current_user = User.find_by(id: session[:uid])
    render json: user
end

private

def user_params
    params.permit(:username, :email, :password)
end

end
