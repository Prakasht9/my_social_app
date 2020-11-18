class Post < ApplicationRecord
  
  enum status: {
    draft: 1,
    published: 2
  }
  
  has_one_attached :avatar, dependent: :destroy
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy


end
