require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


15.times do
user = User.new(
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  email: Faker::Internet.email,
  password: 'topsecret',
  password_confirmation: 'topsecret'
  )
  user.save!

    pet = Pet.new(
    name: Faker::Dog.name,
    address: Faker::Address.full_address,
    category: Faker::Dog.breed,
    age: Faker::Number.number(1),
    size: Faker::Dog.size,
    user_id: User.last.id
    )
    pet.remote_photo_url = "https://dog.ceo/api/breeds/image/random"
    pet.save!

      booking = Booking.new(
      user_id: User.last.id,
      pet_id: Pet.last.id,
      start_date: Date.today,
      end_date: Date.today+3.day
      )
      booking.save!

end
puts 'Finished!'



