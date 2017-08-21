class UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.errors.blank?
      render json: user, serializer: Users::ShowUserSerializer, adapter: :json, root: 'user'
    else
      errors = { errors: user.errors.messages }
      render json: errors, status: 401
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :username, :password, :password_confirmation)
  end
end
