class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.valid?
      user.save
      render json: user
    else
      render json: {errors: user.errors.full_messages}
    end  end

  def update
    user = user.find(params[:id])
  end

  def destroy
    user.find(params[:id]).destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
