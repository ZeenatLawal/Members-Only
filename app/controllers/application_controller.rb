class ApplicationController < ActionController::Base
  def index
    @post = Post.all
    @user = User.all
  end
end
