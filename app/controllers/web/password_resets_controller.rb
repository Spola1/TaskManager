class Web::PasswordResetsController < Web::ApplicationController
  def create
    @password_reset_form = PasswordResetForm.new(password_reset_params)
    return render :new if @password_reset_form.invalid?
    user = @password_reset_form.user

    PasswordResetService.create_password_reset_token!(user)

    UserMailer.with(user: user).password_reset.deliver_now

    redirect_to(root_path, alert: I18n.t('controllers.web.password_resets_controller.email_with_instructions'))
  end

  def update
    @new_password_form = NewPasswordForm.new(password_params)
    if @new_password_form.invalid?
      errors = @new_password_form.errors
      return render :edit if errors.where(:password).present?
      return redirect_to(new_password_path, alert: errors.where(:reset_token).first.message)
    end

    user = @new_password_form.user
    user.update(password_params.slice(:password, :password_confirmation))
    PasswordResetService.delete_password_reset_token!(user)
    redirect_to(new_session_path, alert: I18n.t('controllers.web.password_resets_controller.password_reset'))
  end

  private

  def password_reset_params
    params.require(:password_reset_form).permit(:email)
  end

  def password_params
    params.require(:new_password_form).permit(:password, :password_confirmation, :reset_token)
  end
end
