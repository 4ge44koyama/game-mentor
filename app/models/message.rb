class Message < ApplicationRecord
  validates :to_id, :content, presence: true
  paginates_per 6
  belongs_to :user

  def to_user
    User.find_by(id: to_id)
  end
end
