class User::UsersController < ApplicationController
    before_action :ensure_guest_user, only: [:edit]
    
    def show
        @user = User.find(params[:id])
    end
  
    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user.id)
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
        params.require(:user).permit(:name, :profile_image)
    end
end