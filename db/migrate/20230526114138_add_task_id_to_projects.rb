class AddTaskIdToProjects < ActiveRecord::Migration[7.0]
  def change
    add_column :projects, :task_id, :integer
    add_index :projects, :task_id
    add_foreign_key :projects, :tasks
  end
end
