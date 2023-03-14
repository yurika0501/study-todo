class Post < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    validates :title, presence: true,length:{ maximum: 20 }
    #validates :body, presence: true,length:{ maximum: 200 }
    validate :list1
    validate :list2
    validate :list3
    validate :list4
    validate :list5
    validate :list6
    validate :list7
    validate :list8
    validate :list9
    validate :list10
    
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
  
end
