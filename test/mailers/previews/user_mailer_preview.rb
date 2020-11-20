# Preview all emails at xxx/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at
  # xxx/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end
  
  def order_accepted
    user = User.first
    UserMailer.order_accepted(user)
  end
  

end