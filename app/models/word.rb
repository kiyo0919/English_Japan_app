class Word < ApplicationRecord
  belongs_to :user
  validates :english, presence: true
  validates :japanese, presence: true
  
  def self.search(search)
    if search != ""
      Word.where(['english LIKE(?) OR japanese LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Word.all
    end
  end
end
