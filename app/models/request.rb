class Request < ApplicationRecord
  validates :to_id, presence: true
  validates :status, presence: true, numericality: { equal_to: 1 }
  belongs_to :user

  def to_user
    User.find(to_id)
  end

  def check_status
    if status == 0
      "保留中"
    elsif status == 1
      "承認済"
    else
      "却下"
    end
  end

  def search_post
    Post.find_by(user_id: to_id)
  end

  def reviews
    Review.where(to_id: to_id)
  end
end
