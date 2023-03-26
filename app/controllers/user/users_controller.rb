class User::UsersController < ApplicationController
    before_action :ensure_guest_user, only: [:edit, :is_deleted]
    before_action :is_matching_login_user, only: [:edit, :update]
    
    def show
        @user = User.find(params[:id])
        @posts = @user.posts
        @posts = @user.posts.order(created_at: :desc) #投稿順を新しい順に並び替える記述
        @comment = Comment.new
    end
  
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user.id), notice: "更新に成功しました。"
        else
            render "edit"
        end
    end
    
    # 会員退会画面アクション
    def unsubscribe
    end
    # 会員退会処理アクション
    def withdraw
        current_user.update(is_deleted: true)
        reset_session
        redirect_to root_path
    end


    
    private
    
    # ゲストユーザーならプロフィールの編集を出来ないようにする
    def ensure_guest_user
        @user = User.find(params[:id])
        if @user.name == "guestuser"
            redirect_to user_path(current_user) , notice: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'
        end
    end
    
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction,:is_deleted)
    end
    
    def is_matching_login_user
        user = User.find(params[:id])
        unless user.id == current_user.id
          redirect_to user_path(current_user)
        end
    end
end