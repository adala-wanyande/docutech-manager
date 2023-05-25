class TasksController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_task, only: [:show, :update, :destroy]
  
    def index
      tasks = Task.all
      render json: tasks, each_serializer: TaskSerializer
    end
  
    def show
      render json: task, serializer: TaskSerializer
    end
  
    def create
      task = Task.new(task_params)
      if task.save
        render json: task, status: :created, serializer: TaskSerializer
      else
        render json: { error: task.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if task.update(task_params)
        render json: task, serializer: TaskSerializer
      else
        render json: { error: task.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      task.destroy
      head :no_content
    end
  
    private
  
    def render_not_found_response
        render json: { error: "user not found" }, status: :not_found
    end
  
    def set_task
      task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:name, :description, :due_date, :status, :project_id)
    end
  end
  