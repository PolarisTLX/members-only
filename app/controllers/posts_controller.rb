class PostsController < ApplicationController
  before_action :require_log_in, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      flash[:success] = 'Your gossip has been posted'
      redirect_to root_url
    else
      render :new
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def require_log_in
    unless logged_in?
      flash[:danger] = 'Please log in.'
      redirect_to login_url
    end
  end
end
