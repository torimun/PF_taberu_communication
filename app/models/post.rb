class Post < ApplicationRecord
  has_many_attached :images

  has_many :comments, dependent: :destroy
  belongs_to :tug
  belongs_to :customer
end
