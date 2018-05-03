class UsersController < ApplicationController

  # this is a filter to restrict access only to logged in users:
  # NOTE that we apply ONLY so that this check/filter only occurs on the edit and :edit and :update actions
  before_action :logged_in_user, only: [:edit, :update]

  # this filter is to give specific access to each user:
  before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      remember @user
      flash[:success] = "Welcome to the Gossip App!"
      redirect_to @user
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      # Handle a successful update
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end

  # This is the check to allow the authorisation of a user's access
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  def correct_user
    @user = User.find(params[:id])
    # redirect_to(root_url) unless @user == current_user
    redirect_to(current_user) unless @user == current_user
    # redirect_to(current_user) sends a user to their own profile if they tried accessing a different profile
  end

end
