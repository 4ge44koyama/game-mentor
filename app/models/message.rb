class Message < ApplicationRecord

  belongs_to :user
  validates :user_id, :to_id, :content, presence: true

  def to_user
    return User.find_by(id: self.to_id)
  end

end
