class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  validates :body, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/ }
end
