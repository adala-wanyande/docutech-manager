class ProjectsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  wrap_parameters format: []
 
   def index
     projects = Project.all
     render json: projects, each_serializer: ProjectSerializer
   end
 
   def show
     project = Project.includes(:user, :team_members).find(params[:id])
     render json: project, serializer: ProjectSerializer
   rescue ActiveRecord::RecordNotFound
     render json: { error: "Project not found" }, status: :not_found
   end
   
   def create
   project = Project.create(project_params)
   if project.valid?
     render json: project, status: :created, serializer: Projecterializer
   else
     render json: { error: project.errors.full_messages }, status: :unprocessable_entity
   end
 end
 
   def update
     if project.update(project_params)
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
 
   def project_params
     params.require(:project).permit(:name, :description,)
   end
 
   def render_not_found_response
     render json: { error: "Project not found" }, status: :not_found
   end
 end
 