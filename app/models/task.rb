class Task < ApplicationRecord
  has_many :projects, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :assigned_projects, through: :assignments, source: :project
end
