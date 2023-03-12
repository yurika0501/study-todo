class User::PostsController < ApplicationController
    before_action :is_matching_login_user, only: [:edit, :update, :destroy]
    
    def new
        @post = Post.new
    end
  
    def show
        @post = Post.find(params[:id])
    end
    
    def index
        # @post = Post.new
        @posts = Post.all
        @user = User.find(current_user.id)
    end
    
    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        @post.save
        redirect_to posts_path
    end
    
    def destroy
        @post = Post.find(params[:id]).destroy
        @post.destroy
        redirect_to user_path(user)
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :list1,:list2, :list3, :list4, :list5, :list6, :list7, :list8, :list9, :list10)
    end
end
