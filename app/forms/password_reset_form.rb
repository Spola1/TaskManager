class PasswordResetForm
  include ActiveModel::Model

  attr_accessor :email

  validates :email, presence: true, format: { with: /\A\S+@.+\.\S+\z/ }
  validate :user_exists?

  def user
    @user ||= User.find_by(email: email)
  end

  private

  def user_exists?
    return errors.add(:email, I18n.t('forms.password_reset_form.errors.email_not_exist')) if user.nil?
  end
end
