class PostsController < ApplicationController

  # this is a filter to restrict access only to logged in users:
  # NOTE that we apply ONLY so that this check/filter only occurs on the edit and :edit and :update actions
  before_action :logged_in_user, only: [:new, :create]


  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = "Your gossip has been posted"
      redirect_to root_url
      # root_url will just be where all the posts are shown
    else
      render :new
    end
  end

  # to show all the posts:
  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  # This is the check to allow the authorisation of a user's access
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end


end
