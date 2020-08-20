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

#User1 will follow (following = users[2..50])
following.each{|followed| user.follow(followed)}

#User1's followers will be (followers = user[3..30])
followers.each{|follower| follower.follow(user)}


#CATEGORIES
20.times do |x|
  faker = Faker::Color.color_name
  Category.create!(
    title: faker,
    description: "Spot everything #{faker}!"
  )
end

#WORDS
categories = Category.all 
categories.each do |c|
  Word.create!( category_id: c.id, content: "new word" )
  Word.create!( category_id: c.id, content: "hello" )
  Word.create!( category_id: c.id, content: "bye" )
end

#CHOICES
words = Word.all
words.each do |word|
  Choice.create!( word_id: word.id, content: "this is the answer", isCorrect: "1" )
  Choice.create!( word_id: word.id, content: "wrong choice", isCorrect: "0" )
  Choice.create!( word_id: word.id, content: "Choice 3", isCorrect: "0" )
end
