# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# Assuming you have a User model with attributes like :email and :password

# Create a user
user_data = { email: 'example@example.com', password: 'password' }
user = User.create!(user_data)

# Jobs data
jobs_data = [
  { title: 'Graphic Designer', description: 'Creative role for a graphic designer.', price: 5500, location: 'New York City, New York', available_from: Date.today + 10.days, credit_to_earn: 3 },
  { title: 'Chief Ice Cream Taster', description: 'Scoop, taste, and rate the latest ice cream flavors.', price: 8000, location: 'Waterbury, Vermont', available_from: Date.today + 5.days, credit_to_earn: 5 },
  { title: 'Professional Pillow Fluffer', description: 'Ensure pillows are fluffy and dream-worthy at all times.', price: 6500, location: 'Paris, France', available_from: Date.today + 3.days, credit_to_earn: 4 },
  { title: 'Pet Detective', description: 'Track down missing toys and solve pet mysteries.', price: 7000, location: 'Tokyo, Japan', available_from: Date.today + 8.days, credit_to_earn: 4 },
  { title: 'Chief Napper', description: 'Lead daily napping sessions to boost team productivity.', price: 7500, location: 'London, United Kingdom', available_from: Date.today + 6.days, credit_to_earn: 4 },
  { title: 'Bubble Wrap Popper', description: 'Pop bubble wrap to maintain a stress-free office environment.', price: 6000, location: 'Seoul, South Korea', available_from: Date.today + 4.days, credit_to_earn: 3 },
  { title: 'Prime Minister', description: 'Lead the nation with wisdom and charisma.', price: 10000, location: '10 Downing Street, London', available_from: Date.today + 14.days, credit_to_earn: 8 }
  { title: 'Chocolate Taster', description: 'Indulge in the world of fine chocolates and provide taste reviews.', price: 7000, location: 'Brussels, Belgium', available_from: Date.today + 7.days, credit_to_earn: 5 },
  { title: 'Professional Netflix Watcher', description: 'Watch and rate the latest movies and TV shows for our entertainment recommendations.', price: 6000, location: 'Los Angeles, California', available_from: Date.today + 12.days, credit_to_earn: 4 },
  { title: 'Chief Emoji Designer', description: 'Create and design expressive emojis for a global messaging app.', price: 8500, location: 'Tokyo, Japan', available_from: Date.today + 9.days, credit_to_earn: 6 },
  { title: 'Extreme Adventure Tester', description: 'Test the limits of adventure activities and provide feedback.', price: 9000, location: 'Queenstown, New Zealand', available_from: Date.today + 15.days, credit_to_earn: 7 },
  { title: 'AI Language Model Tester', description: 'Explore and evaluate the capabilities of cutting-edge language models.', price: 7500, location: 'San Francisco, California', available_from: Date.today + 8.days, credit_to_earn: 6 },
  { title: 'Professional Plant Whisperer', description: 'Communicate with plants and ensure their well-being in a botanical garden.', price: 6500, location: 'Amsterdam, Netherlands', available_from: Date.today + 6.days, credit_to_earn: 4 },
  { title: 'Space Tour Guide', description: 'Lead tours to space and provide insights on the wonders of the universe.', price: 11000, location: 'Cape Canaveral, Florida', available_from: Date.today + 20.days, credit_to_earn: 9 }
]

# Associate each job with the created user
jobs_data.each do |job_data|
  puts "Creating job"
  job_data[:user] = user
  Job.create!(job_data)
end
