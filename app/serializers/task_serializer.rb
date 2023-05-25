class TaskSerializer < ActiveModel::Serializer
    attributes :id, :name, :description, :due_date, :status, :project_id
  end