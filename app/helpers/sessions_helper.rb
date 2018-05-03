module SessionsHelper

  # Logs in the user:
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    # if @current_user.nil?
    #   @current_user = User.find_by(id: session[:user_id])
    # else
    #   @current_user
    # end

    # shorter way:
    # @current_user = @current_user || User.find_by(id: session[:user_id])

    # SHORTEST WAY / MOST PROPER using  ||=  ("or equals")
    # this only assigns once, if if does not yet exist.
    # (whereas above assigns every time)
    @current_user ||= User.find_by(id: session[:user_id])

  end

  def logged_in?
    !current_user.nil?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
