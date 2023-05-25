class CommentSerializer < ActiveModel::Serializer
    attributes :id, :content, :user_id, :task_id
  end
  