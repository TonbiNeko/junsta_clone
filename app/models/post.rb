class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :title, presence: true
  validates :content, presence: true
end
