# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.create(username: "big-billy-style", password: "password" )
user2 = User.create(username: "steve", password: "password" )
user3 = User.create(username: "dave", password: "password" )

User.all.each do |user|
  5.times do
    user.questions << Question.create(title: Faker::Hacker.abbreviation, content: "Why would " + Faker::Hacker.say_something_smart.chop + "?")
  end
end

  user1.questions.each do |question|
      2.times do
        question.answers << Answer.create(content: "Because " +  Faker::Hacker.say_something_smart, user_id: user2.id)
        end
      end

  user2.questions.each do |question|
      2.times do
        question.answers << Answer.create(content: Faker::Hacker.say_something_smart, user_id: user3.id)
        end
      end

