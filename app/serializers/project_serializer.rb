class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  belongs_to :user
  has_many :team_members

  has_many :tasks, serializer: TaskSerializer
  end