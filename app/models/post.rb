class Post < ApplicationRecord
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  attachment :image
  validates :body, presence: true, length: { maximum: 280 }
  
end
