class Article < ApplicationRecord
  belongs_to :client
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :genre, presence: true
  has_rich_text :content
  
  enum genre: {
    技術:0,組織・チーム:1,キャリア・働き方:2,会社紹介:3,その他:4
  }
end
