class ApplicationController < ActionController::API
end
rescue_from StandardError, with: :standard_error

def app_response(message: 'success', status: 200, data: nil)
    render json: {
        message: message,
        data: data
    }, status: status
end
 # hash data into webtoken
 def encode(uid)
    payload={
        data:{
            uid: uid
        },
        exp: Time.now.to_i + (6*3600)
    }
    begin
        JWT.encode(payload, ENV['task_bit_key'], 'HS256')
    rescue JWT::EncodeError => e
        app_response(message: 'failed', status: 400, data: { info: 'Something went wrong. Please try again' })
    end
end

 # unhash the token
 def decode(token)
    begin
    JWT.decode(token, ENV['task_bit_key'], false, {algorithm: 'HS256'})
    rescue JWT::DecodeError => e  
        app_response(message: 'failed', status: 401, data: { info: e.message })
    end
end
