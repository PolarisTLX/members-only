class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(username: params[:session][:username])

    if user != nil && user.authenticate(params[:session][:password])
      log_in user

      # if the user checks off the "remember me box? 1 : else 0"
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)

      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to login_path
  end
end
