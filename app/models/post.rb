class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    has_many :tasks, dependent: :destroy
    accepts_nested_attributes_for :tasks
    
    validates :title, presence: true,length:{ maximum: 20 }

      # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @post = Post.where("title LIKE?","%#{word}%")
    else
      @post = Post.all
    end
  end
  
  # ふぁぼがクリックされる度に呼び出すメソッド
  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
