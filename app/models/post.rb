class Post < ApplicationRecord
  acts_as_taggable_on :tags
  acts_as_ordered_taggable_on :tags
  validates :title, presence: true, length: { maximum: 64 }
  validates :content, presence: true, length: { maximum: 800 }
  validates :fee, presence: true
  paginates_per 6
  belongs_to :user
end
