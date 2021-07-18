class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  validates :body, presence: true, length: { maximum: 280 }
  
end
