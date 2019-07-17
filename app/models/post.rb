class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :images, dependent: :delete_all
  has_many :favorites, dependent: :delete_all
  has_many :favorited_users, through: :favorites, source: :user

  accepts_nested_attributes_for :images
end
