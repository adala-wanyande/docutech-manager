class ApplicationController < ActionController::API
end
rescue_from StandardError, with: :standard_error

def app_response(message: 'success', status: 200, data: nil)
    render json: {
        message: message,
        data: data
    }, status: status
end
