class UsersController < ApplicationController
  def new
  end

  def authenticate
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      'send auth process'
    else
      redirect_to '/signup'
    end
  end

  def check_auth_code
    if params[:auth] == 'test'
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :emailid, :password, :password_confirmation)
  end
end
