class Post < ApplicationRecord
  
  has_many :post_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  belongs_to :user

  has_many_attached :post_images

  FILE_NUMBER_LIMIT = 3

  validate :validate_number_of_files
  with_options presence: true, on: :publicize do
    validates :post
  end

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end
  
  
  private

  def validate_number_of_files
    return if post_images.length <= FILE_NUMBER_LIMIT
    errors.add(:post_images, "に添付できる画像は#{FILE_NUMBER_LIMIT}枚までです。")
  end

end
