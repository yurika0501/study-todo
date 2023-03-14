class User::FavoritesController < ApplicationController
    def create
      #@post = Post.find(params[:post_id])
      @post_favorite = Favorite.new(user_id: current_user.id, post_id: params[:post_id])
      @post_favorite.save
      redirect_back(fallback_location: root_path)
    end
    
    def destroy
      #@post = Post.find(params[:post_id])
      @post_favorite = Favorite.find_by(user_id: current_user.id, post_id: params[:post_id])
      @post_favorite.destroy
      redirect_back(fallback_location: root_path)
    end
end
