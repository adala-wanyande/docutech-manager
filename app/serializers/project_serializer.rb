class ProjectSerializer < ActiveModel::Serializer
  attributes :id, :name, :description
  belongs_to :user
  has_many :team_members
  end