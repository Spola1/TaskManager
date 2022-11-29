class Web::PasswordResetsController < Web::ApplicationController
  include PasswordResetsHelper
  before_action :set_user, :check_expiration, only: [:edit, :update]

  def new
    @password_reset = PasswordResetCreateForm.new
  end

  def create
    @password_reset = PasswordResetCreateForm.new(password_reset_params)

    return render :new if @password_reset.invalid?

    user = @password_reset.user
    password_reset_token_update(user)
    UserMailer.with({ user: user }).password_reset.deliver_now
    redirect_to(root_path, alert: I18n.t('controllers.web.password_resets_controller.email_with_instructions'))
  end

  def edit
    @edit_form = PasswordResetUpdateForm.new
  end

  def update
    @edit_form = PasswordResetUpdateForm.new(password_reset_edit_params)

    if @edit_form.invalid?
      return render :edit
    end

    @user.update(password_reset_update_params)
    redirect_to(new_session_path, alert: I18n.t('controllers.web.password_resets_controller.password_reset'))
  end

  private

  def password_reset_params
    params.require(:password_reset_create_form).permit(:email)
  end

  def password_reset_edit_params
    params.require(:password_reset_update_form).permit(:password, :password_confirmation)
  end

  def password_reset_update_params
    reset_token_params = { reset_token: '', reset_token_expires_at: '' }
    password_reset_edit_params.merge(reset_token_params)
  end
end
