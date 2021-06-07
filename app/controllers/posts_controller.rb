class PostsController < ApplicationController

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

    def index
        @post = Post.all
    end

    private
    def post_params
      params.require(:post).permit(:title, :body)
    end
end
