class Task < ApplicationRecord
  belongs_to :project
  has_many :projects, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :assigned_projects, through: :assignments, source: :project
end
