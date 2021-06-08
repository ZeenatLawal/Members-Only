class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def new
    @post = current_user.posts.build
  end

  def index
    @post = Post.all
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to :root
    else
      redirect_to :new_post, notice: 'Invalid entry'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
