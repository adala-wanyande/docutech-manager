# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "seeding.........."
# 50.times { Assignee.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)}

4.times { User.create(username: Faker::Name.first_name, email: Faker::Internet.email, role: "Administrator", password_digest: Faker::Internet.password(min_length: 10, max_length: 20))}

# 100.times {
#   assignee = Assignee.order('RANDOM()').first
#   assigner = Assigner.order('RANDOM()').first

#   1.times{
#     Task.create(
#       task_name: ['Network infrastructure', 'Software Architecture', 'Data_Analytics', 'Machine Learning', 'Behaviour and Test Driven Development'].sample,
#       task_description: Faker::Lorem.paragraph(sentence_count: 2, supplemental: false, random_sentences_to_add: 4),
#       assigner_id: assigner.id ,
#       assignee_id: assignee.id,
#       priority: ['LOW', 'MEDIUM', 'HIGH'].sample,
#       status: ['25%', '50%', '75%', '95%'].sample,
#       start_date: Faker::Date.between(from: 5.days.ago, to: Date.today),
#       end_date: Faker::Date.forward(days: 30)

#     )
#   }
# }


puts "seeded"
