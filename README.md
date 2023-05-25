# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
3.0.4

* Development branch
Confirm changes before pushing to main branch

Base API/Model notes  -- My thought process creating the tables

*User Table/Model:

Columns: id, name, email, password_digest, role
Relationships:
User has_many :projects
User has_many :tasks, through: :assignments
User has_many :comments


*Project Table/Model:

Columns: id, name, description, user_id
Relationships:
Project belongs_to :user
Project has_many :tasks
Project has_and_belongs_to_many :team_members (Users)


*Task Table/Model:

Columns: id, name, description, due_date, status, project_id
Relationships:
Task belongs_to :project
Task has_many :users, through: :assignments
Task has_many :comments

*Comment Table/Model:

Columns: id, content, user_id, task_id
Relationships:
Comment belongs_to :user
Comment belongs_to :task

*Assignment Table/Model:

Columns: id, user_id, task_id
Relationships:
Assignment belongs_to :user
Assignment belongs_to :task

Relationships:

A User can be associated with multiple Projects and can create multiple Comments.
A Project belongs to a single User (administrator) who created it.
A Project can have multiple Tasks.
A Task belongs to a single Project.
A Task can be assigned to multiple Users (team members) through the Assignment join table.
A User can have multiple assigned Tasks through the Assignment join table.
A Task can have multiple Comments.
A Comment belongs to a single User.
A Comment belongs to a single Task.

