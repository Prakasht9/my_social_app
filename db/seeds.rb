# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

# clean tables
User.destroy_all

users_data = []
10.times do
  users_data.push({
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    dob: Date.today ,
    email: Faker::Internet.unique.email,
    password: 'admin007',
    password_confirmation: 'admin007'
  })
end
User.create(users_data)

Faker::Name.unique.clear # Clears used values for Faker::Name
Faker::UniqueGenerator.clear # Clears used values for all generators

posts_data = []
25.times do
  posts_data.push({
    title: Faker::Food.dish,
    body: Faker::Food.description,
    user_id: User.first.id
  })
end
Post.create(posts_data)

