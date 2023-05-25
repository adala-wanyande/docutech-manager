class ProjectsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    before_action :set_project, only: [:show, :update, :destroy]
  
    def index
      projects = Project.all
      render json: projects, each_serializer: ProjectSerializer
    end
  
    def show
      render json: project, serializer: ProjectSerializer
    end
  
    def create
      project = Project.create!(project_params)
      if project.save
        render json: project, status: :created, serializer: ProjectSerializer
      else
        render json: { error: project.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def update
      if project.update!(project_params)
        render json: project, serializer: ProjectSerializer
      else
        render json: { error: project.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def destroy
      project.destroy
      head :no_content
    end
  
    private

    def render_not_found_response
        render json: { error: "user not found" }, status: :not_found
    end
  
  
    def set_project
      project = Project.find(params[:id])
    end
  
    def project_params
      params.require(:project).permit(:name, :description, :user_id)
    end
  end
  