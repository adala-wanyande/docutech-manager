class ApplicationController < ActionController::Base
  before_action :authorization
  skip_before_action :verify_authenticity_token


  def encode_token payload
    JWT::encode(payload, "secret")
  end

  def auth_header
    request.headers["Authorization"]
  end

  def decode_token
    if auth_header
      token = auth_header.split(" ")[1]
      begin
        JWT::decode(token, "secret", true, algorithm: 'HS256')
      rescue JWT::DecodeError
        nil
      end
    end
  end
    # JWT::decode(token, "secret")

  def current_user
    if decode_token
      user_id = decode_token [0]['user_id']
      user = User.find_by(id: user_id)
      render json: user
    end
  end

  def logged_in?
    !!current_user
  end

  def authorization
    render json: {message: 'Kindly log in'}, status: :unauthorized unless logged_in?
  end

end
