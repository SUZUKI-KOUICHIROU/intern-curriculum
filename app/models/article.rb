class Article < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader
  validates :title, length: { maximum: 10 }
  validates :title, presence: true
  validates :content, presence: true
end
