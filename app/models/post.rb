class Post < ApplicationRecord
  acts_as_taggable
  validates :title, :content, :fee, presence: true
  belongs_to :user
  
  def self.search(search)
    if search
      Post.where('title LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
