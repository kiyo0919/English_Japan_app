class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  validates :body, presence: true, length: { maximum: 280 }
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
