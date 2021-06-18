class Label < ApplicationRecord
  has_many :labelings
  has_many :posts, through: :labelings
end
