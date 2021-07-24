class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  attachment :image
  validates :body, presence: true, length: { maximum: 280 }, format: {without: /\A(?:\p{Hiragana}|\p{Katakana}|[ー－]|[一-龠々])+\z/, 
  message: "is in English only"}
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
end
