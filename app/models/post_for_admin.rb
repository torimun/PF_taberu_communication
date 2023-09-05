class PostForAdmin < ApplicationRecord
  has_one_attached :image
  
  belongs_to :admin
  belongs_to :customer
end
