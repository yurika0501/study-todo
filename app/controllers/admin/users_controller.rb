class Admin::UsersController < ApplicationController
#   before_action :if_not_admin
#   before_action :set_post, only: [:destroy]

  def show
    @user = User.find(params[:id])
    # @post = Post.find(params[:id])
    @posts = Post.all
  end

# コメントアウトしている部分は管理者が会員の投稿を消せるようにする記述だがエラーになるため後回し
#   private

#   def if_not_admin
#     redirect_to root_path unless current_user.admin?
#   end

#   def set_post
#     @post = Post.find(params[:id])
#   end
end
