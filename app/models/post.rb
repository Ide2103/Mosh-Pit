class Post < ApplicationRecord

  has_many :post_comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  belongs_to :user

  has_many_attached :post_images

  FILE_NUMBER_LIMIT = 3

  validate :validate_number_of_files
  with_options presence: true, on: :publicize do
    validates :post
  end
  validates :post, length: { maximum: 200 }, on: :publicize

  def bookmarked_by?(user)
    bookmarks.exists?(user_id: user.id)
  end

  def self.search_for(content, method)
    if method == 'perfect'
      Post.where(post: content.to_s)
    else
      Post.where('post LIKE ?', "%" + content.to_s + "%")
    end
  end

  private

  def validate_number_of_files
    return if post_images.length <= FILE_NUMBER_LIMIT
    errors.add(:post_images, "に添付できる画像は#{FILE_NUMBER_LIMIT}枚までです。")
  end

end
