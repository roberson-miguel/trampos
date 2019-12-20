class Comment < ApplicationRecord
  validates :name, :rating, :comment, presence: true
  validates :comment, length: { maximum: 200 }
  RATING = [0,1,2,3,4,5]
  validates :rating, inclusion: {in: RATING}
  belongs_to :profile
end
