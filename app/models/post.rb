class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :labelings, dependent: :destroy
  has_many :labels, through: :labelings

  validates :title, presence: true, length:{ maximum:25} 
  validates :content, presence: true, length:{ maximum:140} 

end
