class Request < ApplicationRecord
  validates :to_id, presence: true
  validates :status, presence: true, numericality: { equal_to: 1 }
  belongs_to :user

  def to_user
    return User.find(self.to_id)
  end

  def check_status
    if self.status == 0
      return "保留中"
    elsif self.status == 1
      return "承認済"
    else
      return "却下"
    end
  end

  def search_post
    return Post.find_by(user_id: self.to_id)
  end

end
