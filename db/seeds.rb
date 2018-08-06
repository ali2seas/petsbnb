require 'faker'
require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

NAME = ["Paul", "Kate", "Ron", "Mike", "Ellen", "Jess", "Frank", "Jarrod", "Diane"]
LAST_NAME = ["Anderson", "Ashwoon", "Aikin", "Bateman", "Bongard", "Bowers", "Boyd", "Cannon", "Cast", "Deitz", "Dewalt", "Ebner", "Frick", "Hancock", "Haworth", "Hesch", "Hoffman", "Kassing", "Knutson", "Lawless", "Lawicki", "Mccord", "McCormack", "Miller", "Myers", "Nugent", "Ortiz", "Orwig", "Ory", "Paiser", "Pak", "Pettigrew", "Quinn", "Quizoz", "Ramachandran", "Resnick", "Sagar", "Schickowski", "Schiebel", "Sellon", "Severson", "Shaffer", "Solberg", "Soloman", "Sonderling", "Soukup", "Soulis", "Stahl", "Sweeney", "Tandy", "Trebil", "Trusela", "Trussel", "Turco", "Uddin", "Uflan", "Ulrich", "Upson", "Vader", "Vail", "Valente", "Van Zandt", "Vanderpoel", "Ventotla", "Vogal", "Wagle", "Wagner", "Wakefield", "Weinstein", "Weiss", "Woo", "Yang", "Yates", "Yocum", "Zeaser", "Zeller", "Ziegler", "Bauer", "Baxster", "Casal", "Cataldi", "Caswell", "Celedon", "Chambers", "Chapman", "Christensen", "Darnell", "Davidson", "Davis", "DeLorenzo", "Dinkins", "Doran", "Dugelman", "Dugan", "Duffman", "Eastman", "Ferro", "Ferry", "Fletcher", "Fietzer", "Hylan", "Hydinger", "Illingsworth", "Ingram", "Irwin", "Jagtap", "Jenson", "Johnson", "Johnsen", "Jones", "Jurgenson", "Kalleg", "Kaskel", "Keller", "Leisinger", "LePage", "Lewis", "Linde", "Lulloff", "Maki", "Martin", "McGinnis", "Mills", "Moody", "Moore", "Napier", "Nelson", "Norquist", "Nuttle", "Olson", "Ostrander", "Reamer", "Reardon", "Reyes", "Rice", "Ripka", "Roberts", "Rogers", "Root", "Sandstrom", "Sawyer", "Schlicht", "Schmitt", "Schwager", "Schutz", "Schuster", "Tapia", "Thompson", "Tiernan", "Tisler"]
PET_NAME = ["Aardvark","Albatross","Alligator","Alpaca","Ant","Anteater","Antelope","Ape","Armadillo","Donkey","Baboon","Badger","Barracuda","Bat","Bear","Beaver","Bee","Bison","Boar","Buffalo","Butterfly","Camel","Capybara","Caribou","Cassowary","Cat","Caterpillar","Cattle","Chamois","Cheetah","Chicken","Chimpanzee","Chinchilla","Chough","Clam","Cobra","Cockroach","Cod","Cormorant","Coyote","Crab","Crane","Crocodile","Crow","Curlew","Deer","Dinosaur","Dog","Dogfish"]
CATEGORY = ["dog", 'cat', "rabbit", "reptile", "other"]
AGE = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
USER_AGE = (18..60).to_a
SIZE = ["small", "medium", "large"]
PETS_DESC1 = ["Beautiful, ", "Friendly, ", "Calm, ", "Energetic, "]
PETS_DESC2 = ["fun loving ", "obedient ", "well trained ", "snuggle loving "]
PETS_DESC3 = ["little guy", "real sweetheart", "lovely boy"]
PETS_DESC4 = ["go out for a walk", "take his eyedrops", "be fed"]
USER_DESCRIPTION = ["Pet lover", "I enjoy spending time with my 2 little puppies", "Animals are part of my family"]

(1..10).to_a.each do |number|
user = User.new(
  first_name: NAME.sample,
  last_name: LAST_NAME.sample,
  email: Faker::Internet.email,
  password: 'topsecret',
  password_confirmation: 'topsecret',
  age: USER_AGE.sample,
  description: USER_DESCRIPTION.sample
  )
  user.remote_photo_url = "https://res.cloudinary.com/dltvtttdn/image/upload/v1533527550/#{(21..25).to_a.sample}.jpg"
  user.save!

    pet = Pet.new(
    name: PET_NAME.sample,
    address: Faker::Address.full_address,
    category: "dog",
    age: AGE.sample,
    size: SIZE.sample,
    user_id: User.last.id,
    description: "#{PETS_DESC1.sample}#{PETS_DESC2.sample}#{PETS_DESC3.sample}. Needs to #{PETS_DESC4}"
    )
    pet.remote_photo_url = "https://res.cloudinary.com/dltvtttdn/image/upload/v1533527550/#{number}.jpg"
    pet.save!

      booking = Booking.new(
      user_id: User.last.id,
      pet_id: Pet.last.id,
      start_date: Date.today,
      end_date: Date.today+3.day,
      # rating: (1..5).to_a.sample
      )
      booking.save!
end

[11,12,13,14].each do |number|
user = User.new(
  first_name: NAME.sample,
  last_name: LAST_NAME.sample,
  email: Faker::Internet.email,
  password: 'topsecret',
  password_confirmation: 'topsecret',
  age: USER_AGE.sample,
  description: USER_DESCRIPTION.sample
  )
  (21..25).to_a.each do |number|
    user.remote_photo_url = "https://res.cloudinary.com/dltvtttdn/image/upload/v1533527550/#{number}.jpg"
  end
  user.save!

    pet = Pet.new(
    name: PET_NAME.sample,
    address: Faker::Address.full_address,
    category: "cat",
    age: AGE.sample,
    size: SIZE.sample,
    user_id: User.last.id,
    description: "#{PETS_DESC1.sample}#{PETS_DESC2.sample}#{PETS_DESC3.sample}. Needs to #{PETS_DESC4}"
    )
    pet.remote_photo_url = "https://res.cloudinary.com/dltvtttdn/image/upload/v1533527550/#{number}.jpg"
    pet.save!

      booking = Booking.new(
      user_id: User.last.id,
      pet_id: Pet.last.id,
      start_date: Date.today,
      end_date: Date.today+3.day,
      # rating: (1..5).to_a.sample
      )
      booking.save!
end

user = User.new(
  first_name: NAME.sample,
  last_name: LAST_NAME.sample,
  email: Faker::Internet.email,
  password: 'topsecret',
  password_confirmation: 'topsecret',
  age: USER_AGE.sample,
  description: USER_DESCRIPTION.sample
  )
  user.remote_photo_url = "https://res.cloudinary.com/dltvtttdn/image/upload/v1533527550/#{(21..25).to_a.sample}.jpg"
  user.save!

    pet = Pet.new(
    name: PET_NAME.sample,
    address: Faker::Address.full_address,
    category: "rabbit",
    age: AGE.sample,
    size: SIZE.sample,
    user_id: User.last.id,
    description: "#{PETS_DESC1.sample}#{PETS_DESC2.sample}#{PETS_DESC3.sample}. Needs to #{PETS_DESC4}"
    )
    pet.remote_photo_url = "https://media.mnn.com/assets/images/2017/03/bunny-eating-clover.jpg.696x0_q80_crop-smart.jpg"
    pet.save!

      booking = Booking.new(
      user_id: User.last.id,
      pet_id: Pet.last.id,
      start_date: Date.today,
      end_date: Date.today+3.day,
      # rating: (1..5).to_a.sample
      )
      booking.save!


[15, 16].each do |number|
user = User.new(
  first_name: NAME.sample,
  last_name: LAST_NAME.sample,
  email: Faker::Internet.email,
  password: 'topsecret',
  password_confirmation: 'topsecret',
  age: USER_AGE.sample,
  description: USER_DESCRIPTION.sample
  )
  user.remote_photo_url = "https://res.cloudinary.com/dltvtttdn/image/upload/v1533527550/#{(21..25).to_a.sample}.jpg"
  user.save!

    pet = Pet.new(
    name: PET_NAME.sample,
    address: Faker::Address.full_address,
    category: "reptile",
    age: AGE.sample,
    size: SIZE.sample,
    user_id: User.last.id,
    description: "#{PETS_DESC1.sample}#{PETS_DESC2.sample}#{PETS_DESC3.sample}. Needs to #{PETS_DESC4}"
    )
      pet.remote_photo_url = "https://res.cloudinary.com/dltvtttdn/image/upload/v1533527550/#{number}.jpg"
    pet.save!

      booking = Booking.new(
      user_id: User.last.id,
      pet_id: Pet.last.id,
      start_date: Date.today,
      end_date: Date.today+3.day,
      # rating: (1..5).to_a.sample
      )
      booking.save!
end
puts 'Finished!'




