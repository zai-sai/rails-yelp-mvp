# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require "faker"

puts "Creating 10 restaurants..."
10.times do
  puts "creating restaurant..."
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample,
  )
  restaurant.save!
  puts "saved..."
  3.times do
    review = Review.new(
      rating: rand(0..5),
      content: Faker::Quote.famous_last_words,
      restaurant_id: restaurant.id
    )
    review.save!
  end
  puts "reviews added..."
end
puts "10 restaurants with reviews saved to database!"
