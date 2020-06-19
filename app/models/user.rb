class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, :password, :password_confirmation, presence: true
  mount_uploader :image, ImageUploader
  has_one :post, dependent: :destroy
  has_many :requests, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :reviews, dependent: :destroy

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end

  def reviews
    Review.where(to_id: id)
  end
end
