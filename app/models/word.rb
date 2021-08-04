class Word < ApplicationRecord
  belongs_to :user
  validates :english, presence: true
  validates :japanese, presence: true
end
