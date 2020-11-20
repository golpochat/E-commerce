class UserMailer < ApplicationMailer

  #Sends an email to the user with their activation details
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end
  
  #Sends an email to the user upon creating and completing their order
  def order_accepted(user, order)
    @user = user
    @order = order
    mail to: user.email, subject: "Order Successful"
  end
end
