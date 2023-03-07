class User::PostsController < ApplicationController
    before_action :is_matching_login_user, only: [:edit, :update, :destroy]
    
    def new
        @post = Post.new
    end
    
    def index
        @posts = Post.all
        @user = User.find(params[:id])
    end
    
    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to posts_path, notice: "投稿が完了しました"
        else
            render :new
        end
    end
    
    private
    def post_params
        params.require(:post).permit(:title, :list)
    end
end
