class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :post_for_admins, dependent: :destroy
  has_many :posts, dependent: :destroy

  #ゲストログイン関連
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.user_name = "ゲストユーザー"
      customer.introduction = 'これはゲストアカウント為、編集機能はご利用できません。'
    end
  end

end
