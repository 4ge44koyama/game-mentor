class Review < ApplicationRecord
  validates :content, presence: true, length: { maximum: 200 }
  validates :rate, presence: true
  validates :to_id, presence: true
  belongs_to :user
end