class Image < ApplicationRecord
  belongs_to :post

  mount_uploader :image_id, ImageUploader
end
