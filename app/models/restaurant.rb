class Restaurant < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

  # method unneccesary
  # same as `dependent: :destroy`
      # def destroy
      #   @reviews = Review.where(restaurant: self)
      #   @reviews.each { |review| review.destroy }
      #   super
      # end
end
