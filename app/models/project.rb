class Project < ApplicationRecord
  belongs_to :user
  has_many :assignments, dependent: :destroy
  has_many :team_members, through: :assignments, source: :user
end
