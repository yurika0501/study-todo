class Post < ApplicationRecord
    belongs_to :user
    
    validates :title, presence: true,length:{ maximum: 20 }
    #validates :body, presence: true,length:{ maximum: 200 }
    validates :list, presence: true
end
