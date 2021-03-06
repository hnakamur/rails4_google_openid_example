class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    auth = request.env["omniauth.auth"]
    session[:user_info] = auth["info"]
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_info] = nil
    redirect_to root_url, notice: "Signed out!"
  end
end
