class TodosController < ApplicationController
    before_action :verify_auth
    
    def create
        todo = user.todos.create(todo_params)
        if todo.valid?
            app_response(status: :created, data: todo)
        else
            app_response(status: :unprocessable_entity, data: todo.errors, message: "failed to create")
        end
    end

    def update
        todo = user.todos.find(params[:id]).update(todo_params)
        if todo
            app_response(data: { info: 'updated todo successfully' })
        else
            app_response(message: 'failed', data: { info: 'something went wrong. could not update todo' }, status: :unprocessable_entity)
        end
    end

    def destroy
        todo = user.todos.find(params[:id])
        todo.destroy
        app_response(status: 204)
    end

    def show
        todo = user.todos.find(params[:id])
        if todo
            app_response(message: 'success', data: todo)  
        else
            app_response(message: 'failed', data: { info: 'not found' }, status: 404)
        end
    end


