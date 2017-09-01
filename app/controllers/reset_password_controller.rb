class ResetPasswordController < ApplicationController
  def create
    user = User.find_by(email_params)
    if user.nil?
      error = { errors: 'Email not found' }
      render json: error, status: 404
    else
      user.skip_password_validation = true
      if user.update_attributes(reset_token: SecureRandom.hex(10),
                                reset_send_at: Time.now)
        message = { message: 'Please check your email!' }
        render json: message
      end
    end
  end

  def update
    user = User.find_by(reset_token: params[:id])
    if user.nil?
      error = { errors: 'Sorry, we couldn\'t find that password reset key.' }
      render json: error, status: 404
    elsif user.update(reset_params.merge(reset_token: nil, reset_send_at: nil))
      message = { message: 'Reset password successfully!' }
      render json: message
    else
      errors = { errors: @current_user.errors.full_messages }
      render json: errors, status: 401
    end
  end

  private

  def email_params
    params.require(:user).permit(:email)
  end

  def reset_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
