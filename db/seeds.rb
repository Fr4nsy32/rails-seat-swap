# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Job.create([
  { id: 1, title: 'Web Developer', description: 'Exciting opportunity for a web developer.', price: 6000, location: 'San Francisco, California', available_from: Date.today + 7.days, credit_to_earn: 4 },
  { id: 2, title: 'Graphic Designer', description: 'Creative role for a graphic designer.', price: 5500, location: 'New York City, New York', available_from: Date.today + 10.days, credit_to_earn: 3 },
  { id: 3, title: 'Chief Ice Cream Taster', description: 'Scoop, taste, and rate the latest ice cream flavors.', price: 8000, location: 'Waterbury, Vermont', available_from: Date.today + 5.days, credit_to_earn: 5 },
  { id: 4, title: 'Professional Pillow Fluffer', description: 'Ensure pillows are fluffy and dream-worthy at all times.', price: 6500, location: 'Paris, France', available_from: Date.today + 3.days, credit_to_earn: 4 },
  { id: 5, title: 'Pet Detective', description: 'Track down missing toys and solve pet mysteries.', price: 7000, location: 'Tokyo, Japan', available_from: Date.today + 8.days, credit_to_earn: 4 },
  { id: 6, title: 'Chief Napper', description: 'Lead daily napping sessions to boost team productivity.', price: 7500, location: 'London, United Kingdom', available_from: Date.today + 6.days, credit_to_earn: 4 },
  { id: 7, title: 'Bubble Wrap Popper', description: 'Pop bubble wrap to maintain a stress-free office environment.', price: 6000, location: 'Seoul, South Korea', available_from: Date.today + 4.days, credit_to_earn: 3 },
  { id: 8, title: 'Prime Minister', description: 'Lead the nation with wisdom and charisma.', price: 10000, location: '10 Downing Street, London', available_from: Date.today + 14.days, credit_to_earn: 8 }
])
