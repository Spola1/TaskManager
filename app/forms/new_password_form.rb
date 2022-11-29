class NewPasswordForm
  include ActiveModel::Model
  include ActiveModel::SecurePassword

  attr_accessor :reset_token, :password_digest, :password_digest_confirmation

  has_secure_password

  validate :token_invalid?

  def user
    @user ||= User.find_by(reset_token: reset_token)
  end

  def token_invalid?
    return errors.add(:reset_token, I18n.t('forms.new_password_form.errors.link_invalid')) if user.nil?

    return errors.add(:reset_token, I18n.t('forms.new_password_form.errors.link_expired')) if PasswordResetService.password_reset_token_expired?(user)
  end
end
