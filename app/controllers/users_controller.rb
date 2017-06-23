class UsersController < ApplicationController
  def activate
    @user = User.find_by_activation_token(params[:activation_token])
    @user.activate!
    login_user!(@user)
    flash[:notice] = "account activated!"
    redirect to root_url
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_session_url
    else 
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def new
    @user = User.new
    render :new
  end

  def show
    render :show
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
