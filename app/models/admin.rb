class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :rememberable, :validatable

  has_many :post_for_admins, dependent: :destroy
  has_many :seasonings_spices, dependent: :destroy

end
