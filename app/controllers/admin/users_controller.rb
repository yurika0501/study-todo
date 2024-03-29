class Admin::UsersController < ApplicationController
#   before_action :if_not_admin
#   before_action :set_post, only: [:destroy]

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
      if @user.update(user_params)
        redirect_to admin_user_path(@user.id)
      else
        render :edit, notice: "変更に失敗しました"
      end
  end

# コメントアウトしている部分は管理者が会員の投稿を消せるようにする記述だがエラーになるため後回し
  private

#   def if_not_admin
#     redirect_to root_path unless current_user.admin?
#   end

#   def set_post
#     @post = Post.find(params[:id])
#   end
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction,:is_deleted)
  end
end
