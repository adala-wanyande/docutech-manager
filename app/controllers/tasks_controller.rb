#Next item Serializers

class TasksController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response

    #berore_action :authenticate_user! #Not yet merged


    # GET /tasks
    def index
      #tasks = current_user.tasks
      #tasks = Task.all.includes(:user).order(created_at: :desc)
      #render json: tasks, each_serializer: TaskListSerializer
      render json: {page: "tasks"}
    end
  
     # GET /tasks/:id
    def show
      tasks = Task.find(params[:id])
      render json: tasks
    end

    # POST /tasks
    def create
      task = Task.create!(task_params)
      render json: task, status: :created
    end

    # PATCH /tasks/:id
    def update
      task = find_task
      task.update!(task_params)
      render json: task
    end

    # DELETE /tasks/:id
    def destroy
      task = find_task
      task.destroy
      head :no_content
    end
      
  
    private

    def find_task
      Task.find(params[:id])
    end

    def task_params
      params.permit(:title, :description, :comments)
    end
  
    def record_not_found
      render json: { error: "Article not found" }, status: :not_found
    end

    def render_unprocessable_entity_response(invalid)
      render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

  
  end