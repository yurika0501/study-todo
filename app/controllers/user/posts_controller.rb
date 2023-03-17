class User::PostsController < ApplicationController
    before_action :is_matching_login_user, only: [:edit, :update, :destroy]
    
    def new
        @post = Post.new
    end
  
    def show
        @user = current_user
        @post = Post.find(params[:id])
        @comment = Comment.new
        @check = Check.new #新しいCheck
        @check.list[i] = params[:check] #checksテーブルのlistカラムにviewから受け取ったparamsを代入
        @check.save #データベースに保存
        @checks = Check.order(created_at: :desc).limit(1) #checksテーブルから最新のレコードを取得
    end
    
    def index
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
        redirect_to user_path(@post.user.id)
    end
    
    private
    
    def post_params
        params.require(:post).permit(:title, :list1,:list2, :list3, :list4, :list5, :list6, :list7, :list8, :list9, :list10)
    end
    
    def is_matching_login_user
        user_id = Post.find(params[:id]).user.id
        unless user_id == current_user.id
          redirect_to posts_path
        end
    end
  
end
