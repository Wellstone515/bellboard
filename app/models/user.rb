class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments
  has_many :favorites, dependent: :destroy
  has_many :favorited_posts, through: :favorites, source: :post

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
