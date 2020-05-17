class Message < ApplicationRecord

  validates :to_id, :content, presence: true
  paginates_per 6
  belongs_to :user

  def to_user
    return User.find_by(id: self.to_id)
  end

end
