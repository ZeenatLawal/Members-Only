class PostsController < ApplicationController

    before_action :authenticate_user!, only: [:index]

    def new
        @post = Post.new()
    end

    def create
        @post = Post.new(post_params)

        if @post.save
            redirect_to :root
        else
            redirect_to :root
        end
    end

    private
    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end
end
