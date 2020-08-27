# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  name: "Admin",
  email: "admin@gmail.com",
  password: "password",
  password_confirmation: "password",
  isAdmin: "1")

50.times do |n|
  name = Faker::Name.unique.name
  email = "username#{n+1}@email.com"
  password = "password"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    isAdmin: "0"
  )
end

#FOLLOW
users = User.all
user = users.first

#User1 will follow User2 until User50
following = users[2..50]

#User1 has followers starting from User3 to User30
followers = users[3..30]

following.each{|followed| user.follow(followed).create_activity(user: user)}
followers.each{|follower| follower.follow(user).create_activity(user: follower)}


#CATEGORIES
20.times do |n|
  title = Faker::Name.unique.name
  description =  "Lorem Epsum"
  Category.create!(title: title,description: description)

  10.times do
    content = Faker::Lorem.word
    word = Category.all.sample.words.build content: content
    word.choices = [
      Choice.new(content: content, isCorrect: true),
      Choice.new(content: Faker::Music.instrument, isCorrect: false),
      Choice.new(content: Faker::Music.chord, isCorrect: false)
    ].shuffle
    word.save(validate: false)
  end
end
