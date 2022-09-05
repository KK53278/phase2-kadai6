class Book < ApplicationRecord
  belongs_to :user
  # ↑ booksに対して1:nを定義
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
