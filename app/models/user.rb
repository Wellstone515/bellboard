class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  has_many :favorites, dependent: :delete_all
  has_many :favorited_posts, through: :favorites, source: :post

  def already_favorited?(post)
    self.favorites.exists?(post_id: post.id)
  end
end
