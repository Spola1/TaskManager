module PasswordResetsHelper
  TOKEN_EXPIRES_AT = 24.hour.from_now

  def password_reset_token_update(user)
    reset_token = SecureRandom.urlsafe_base64
    user.update(reset_token: reset_token, reset_token_expires_at: TOKEN_EXPIRES_AT)
  end

  def set_user
    @user = User.find_by(reset_token: params[:id])
    unless @user
      flash[:alert] = I18n.t('helpers.application_helper.alerts.user_not_found')
      redirect_to(root_url)
    end
  end

  def check_expiration
    if @user.reset_token_expires_at < Time.now
      flash[:alert] = I18n.t('helpers.application_helper.alerts.token_has_expired')
      redirect_to(new_password_reset_url)
    end
  end
end
