class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :images
  has_many :favorites
  has_many :favorited_users, through: :favorites, source: :user

  accepts_nested_attributes_for :images
end
