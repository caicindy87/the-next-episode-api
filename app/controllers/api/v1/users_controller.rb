class Api::V1::UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    user = User.new(user_params)

    if user.valid?
      user.save
      my_token = issue_token(user)
      
      render json: {id: user.id, username: user.username, token: my_token}, status: :created
    else
      render json: {error: user.errors.full_messages}, status: :not_acceptable
    end  
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
