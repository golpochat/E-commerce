class SessionsController < ApplicationController
# Following session controller is from Ruby on Rails Tutorial (Rails 5) Michael Hartl
  def new
  end
  
  #Creates a new session if a user logs in and allows for remembering log in
  def create
    
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        # If the account hasn't been activated the user is notified
        message  = "Account not activated."
        message += "Check your email for activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email / password combination'
      render 'new'
    end
  end

  #If the user logs out it destorys the session
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end