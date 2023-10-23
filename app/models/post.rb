class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail
  has_rich_text :body
end
