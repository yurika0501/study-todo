class User::PostsController < ApplicationController
    before_action :is_matching_login_user, only: [:edit, :update, :destroy]
    
    def new
        @post = Post.new #タイトルの新規作成
        @post.tasks = Array.new(10).map{ Task.new } #タスクの新規作成 →cocoonで直したほうがよい
    end
  
    def show
        @user = current_user
        @post = Post.find(params[:id])
        @comment = Comment.new
    end
    
    def index
      @user = current_user
      following_ids = @user.followings.pluck(:id)
      following_ids << @user.id
      # フォローしているユーザーの投稿と、現在ログインしているユーザー自身の投稿を新規投稿順に並べ、ページネーションを使用する記述
      @posts = Post.where(user_id: following_ids).page(params[:page]).order(created_at: :desc)
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def update #チェックボックスの更新
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to post_path(params[:id])
    end

    def destroy
        @post = Post.find(params[:id]).destroy
        redirect_to user_path(@post.user.id)
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, tasks_attributes: [:id, :content, :complete]) #チェックボックスの更新にも使われている
    end
    
    def is_matching_login_user
        user_id = Post.find(params[:id]).user.id
        unless user_id == current_user.id
          redirect_to posts_path
        end
    end
  
end
