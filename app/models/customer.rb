class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable

  has_many :post_for_admins, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  #ゲストログイン関連
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.user_name = "ゲストユーザー"
      customer.introduction = 'これはゲストアカウント為、編集機能はご利用できません。'
    end
  end

  #会員の検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @customer = Customer.where("user_name LIKE?", "#{word}")
    elsif search == "forward_match"
      @customer = Customer.where("user_name LIKE?","#{word}%")
    elsif search == "backward_match"
      @customer = Customer.where("user_name LIKE?","%#{word}")
    else search == "partial_match"
      @customer = Customer.where("user_name LIKE?","%#{word}%")
    end
  end

end
