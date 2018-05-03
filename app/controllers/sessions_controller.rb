class SessionsController < ApplicationController

  def new

  end

  def create
      user = User.find_by(username: params[:session][:username])

      if user && user.authenticate(params[:session][:password])

        # If username exists and password matches, log in
        log_in user   # long_in is a helper method that we created in sessions_helper.rb.  sessions_helper.rb we said to be included in applications_controller

        redirect_to user # Rails automatically converts this to the route for the user’s profile page:  user_url(user)

      else

        # Create an error message
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'

      end
  end

  def destroy
    log_out
    redirect_to login_path
  end

end