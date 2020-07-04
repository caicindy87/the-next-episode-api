class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]
  
    def create
      user = User.find_by(username: params[:username])

      if user && user.authenticate(params[:password]) 
        my_token = issue_token(user)
  
        render json: {id: user.id, username: user.username, token: my_token}
      else
        render json: {error: 'Invalid username or password'}, status: 401
      end
    end
  
    def show
      render json: { id: current_user.id, username: current_user.username }
    end
  end