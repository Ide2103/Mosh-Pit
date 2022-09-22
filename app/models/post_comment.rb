class PostComment < ApplicationRecord

  belongs_to :user
  belongs_to :post
  validates :comment, presence: true, length: {maximum: 150}

  def self.search_for(content, method)
    print(method)
    if method == 'perfect'
      PostComment.where(comment: content.to_s)
    else
      PostComment.where('comment LIKE ?', "%" + content.to_s + "%")
    end
  end
end