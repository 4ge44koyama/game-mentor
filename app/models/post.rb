class Post < ApplicationRecord
  
  acts_as_taggable_on :tags
  acts_as_ordered_taggable_on :tags
  validates :title, :content, :fee, presence: true
  belongs_to :user
  
end
