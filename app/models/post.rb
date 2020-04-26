class Post < ApplicationRecord
  validates :title, :content, :fee, presence: true
  belongs_to :user
  
end
