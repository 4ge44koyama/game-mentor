class Request < ApplicationRecord
  belongs_to :user
  validates :user_id, :to_id, :status, presence: true
end
