class AccountActivationsController < ApplicationController
# Following activation controller is from Ruby on Rails Tutorial (Rails 5) Michael Hartl

#Checks if the user has activated their account
  def edit
    user = User.find_by(email: params[:email])
    #Checks if the user is already activated and is authenticated and logs them in
    if user && !user.activated? && user.authenticated?(:activation, params[:id])
      user.activate
      log_in user
      
      flash[:success] = "Account activated!"
      redirect_to user
    else
      flash[:danger] = "Invalid activation link"
      redirect_to root_url
    end
  end
end