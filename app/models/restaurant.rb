class Restaurant < ApplicationRecord
  has_many :reviews

  validates :name, :address, :category, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

  def destroy
    @reviews = Review.where(restaurant: self)
    @reviews.each { |review| review.destroy }
    super
  end
end
