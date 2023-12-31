class Post < ApplicationRecord
  has_many_attached :images

  has_many :comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags, dependent: :destroy
  has_many :favorites, dependent: :destroy
  belongs_to :customer

  validates :comment, presence: true

  #会員が投稿に対して「いいね」しているかを確認するメソッド
  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end

  #投稿の検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @post = Post.where("comment LIKE?","#{word}")
    elsif search == "forward_match"
      @post = Post.where("comment LIKE?","#{word}%")
    elsif search == "backward_match"
      @post = Post.where("comment LIKE?","%#{word}")
    else search == "partial_match"
      @post = Post.where("comment LIKE?","%#{word}%")
    end
  end

  #タグを保存するメソッド
  def save_tags(tags)

    # タグをスペース区切りで分割し配列にする
    #   連続した空白も対応させるので、最後の“+”がポイント
    tag_list = tags.split(/[[:blank:]]+/)

    # 自分自身に関連づいたタグを取得する
    current_tags = self.tags.pluck(:tag)

    # (1) 元々自分に紐付いていたタグと投稿されたタグの差分を抽出
    #   -- 記事更新時に削除されたタグ
    old_tags = current_tags - tag_list

    # (2) 投稿されたタグと元々自分に紐付いていたタグの差分を抽出
    #   -- 新規に追加されたタグ
    new_tags = tag_list - current_tags

    p current_tags

    # tag_mapsテーブルから、(1)のタグを削除
    #   tagsテーブルから該当のタグを探し出して削除する
    old_tags.each do |old|
      # tag_mapsテーブルにあるpost_idとtag_idを削除
      #   後続のfind_byでtag_idを検索
      self.tags.delete Tag.find_by(tag: old)
    end

    # tagsテーブルから(2)のタグを探して、tag_mapsテーブルにtag_idを追加する
    new_tags.each do |new|
      # 条件のレコードを初めの1件を取得し1件もなければ作成する
      new_post_tag = Tag.find_or_create_by(tag: new)

      # tag_mapsテーブルにpost_idとtag_idを保存
      #   配列追加のようにレコードを渡すことで新規レコード作成が可能
      self.tags << new_post_tag
    end

  end
end
