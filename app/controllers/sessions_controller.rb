class SessionsController < ApplicationController
  def new
    render :new
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def create
    user = User.find_by_credentials( params[:user][:email], params[:user][:password])

    if user.nil?
      flash[:errors] = ["invalid credentials"]
      render :new
    elsif !user.activated?
      redirect_to root_url, alert: "please activate your account first"
    else
      login_user!(user)
      redirect_to root_url
    end
  end

end
