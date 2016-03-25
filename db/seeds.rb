# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(username: "big-billy-style", password: "password" )

10.times do
  User.create(username: Faker::Internet.user_name, password: "1234" )
end

User.all.each do |user|
  5.times do
    user.questions << Question.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph(2))
  end
end

