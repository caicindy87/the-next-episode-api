class ApplicationController < ActionController::API
    before_action :authorized
  
    def issue_token(user)
      JWT.encode({user_id: user.id}, auth_secret, 'HS256')
    end
  
    def token
      request.headers['Authorization']
    end
    
    def decoded_token
      if token 
        begin
          JWT.decode(token, auth_secret, true, { :algorithm => 'HS256' })
        rescue JWT::DecodeError
          nil
        end
      end
    end
  
    def user_id
      if decoded_token
        decoded_token[0]["user_id"]
      end
    end

    def current_user
      if user_id
        user ||= User.find_by(id: user_id)
      end
    end
  
    def logged_in?
      !!current_user
    end
  
    def authorized
      render json: { message: "Please log in" }, status: :unauthorized unless logged_in?
    end

    private

    def auth_secret
      ENV["AUTH_SECRET"]
    end
  end