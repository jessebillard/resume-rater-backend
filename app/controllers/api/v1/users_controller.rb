class Api::V1::UsersController < ApplicationController
  skip_forgery_protection
  def show
    @user = User.find(params[:id])

    render json: @user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user
    else
      render json: error_message
    end

  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def error_message
    {status: "error", code: 400, message: "Bad Request Bro!"}
  end

end
