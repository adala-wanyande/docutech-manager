puts "Deleting seeds"
Assignment.destroy_all
Comment.destroy_all
Task.destroy_all
Project.destroy_all
User.destroy_all
puts "Done deleting seeds"

puts "Seeding"

# Create Users
admin = User.create(name: "Admin", email: "admin@example.com", role: "administrator")
team_member = User.create(name: "John Doe", email: "john@example.com", role: "team_member")

# Create Projects
project1 = Project.create(name: "Project 1", description: "Sample project 1", user: team_member)
project2 = Project.create(name: "Project 2", description: "Sample project 2", user: admin)

# Create Tasks
task1 = Task.create(name: "Task 1", description: "Sample task 1", due_date: Date.today + 7, status: "in progress", project: project1)
task2 = Task.create(name: "Task 2", description: "Sample task 2", due_date: Date.today + 14, status: "done", project: project1)

# Create Comments
Comment.create(content: "This task looks challenging.", user: team_member, task: task1)
Comment.create(content: "Great job on completing this task!", user: team_member, task: task1)

puts "Done seeding"
