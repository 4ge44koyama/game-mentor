class Post < ApplicationRecord
  acts_as_taggable
  validates :title, :content, :fee, presence: true
  belongs_to :user
  
end
