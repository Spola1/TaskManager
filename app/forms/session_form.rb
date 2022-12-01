class SessionForm
  include ActiveModel::Model

  attr_accessor :email, :password

  validates :email, presence: true, format: { with: /\A\S+@.+\.\S+\z/ }
  validates :password, presence: true
  validate :user_valid?

  def user
    User.find_by(email: email)
  end

  private

  def user_valid?
    return errors.add(:email, I18n.t('forms.session_form.errors.email_or_password_invalid')) if user.blank? || !user.authenticate(password)
  end
end
