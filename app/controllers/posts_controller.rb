class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @post = Post.new
  end

  def index
    @post = Post.all
    @user = User.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to :root
    else
      redirect_to :new_post
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end
end
