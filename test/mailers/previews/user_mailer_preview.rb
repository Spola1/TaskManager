# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def task_created
    user = User.first
    task = Task.first
    params = { user: user, task: task }

    UserMailer.with(params).task_created
  end

  def task_updated
    user = User.first
    task = Task.first
    params = { user: user, task: task }

    UserMailer.with(params).task_updated
  end

  def task_deleted
    user = User.first
    task = Task.first
    params = { user: user, task: task }

    UserMailer.with(params).task_deleted
  end

  test 'password reset' do
    @user.create_password_reset_token
    params = { user: @user }
    email = UserMailer.with(params).password_reset

    assert_emails(1) { email.deliver_now }
    assert_equal ['noreply@taskmanager.com'], email.from
    assert_equal [@user.email], email.to
    assert_equal 'Reset your password', email.subject
    assert email.body.to_s.include?('Reset your password')
  end
end
