class Article < ApplicationRecord
  has_many :comments, dependent: :destroy
  
  def to_param
    slug 
  end

  validates :title, presence: true
  validates :slug, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
