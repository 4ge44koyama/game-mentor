class Request < ApplicationRecord
  belongs_to :user
  validates :user_id, :to_id, :status, presence: true

  def to_user
    return User.find_by(id: self.to_id)
  end

  def status_check
    if self.status == 0
      return "保留中"
    elsif self.status == 1
      return "承認済"
    else
      return "却下"
    end
  end

end
