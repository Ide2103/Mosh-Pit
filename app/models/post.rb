class Post < ApplicationRecord
  has_many_attached :post_images
  belongs_to :user

  FILE_NUMBER_LIMIT = 3

  validate :validate_number_of_files

  private

  def validate_number_of_files
    return if post_images.length <= FILE_NUMBER_LIMIT
    errors.add(:post_images, "に添付できる画像は#{FILE_NUMBER_LIMIT}枚までです。")
  end
end
