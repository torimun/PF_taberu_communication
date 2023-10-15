class PostForAdmin < ApplicationRecord
  has_one_attached :image

  belongs_to :customer

  validates :image, presence: true
  validates :classification, presence: true
  validates :name, presence: true
  validates :detail, presence: true
  validates :usega, presence: true
end
