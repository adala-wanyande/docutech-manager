require 'swagger_helper'

RSpec.describe 'api/my', type: :request do
  before do
    # Load the Swagger documentation from the specified path
    # Adjust the path if necessary
    load Rails.root.join('swagger', 'swagger.json')
  end

  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string },
          password: { type: :string },
          password_confirmation: { type: :string },
          email: { type: :string },
          role: { type: :string }
        },
        required: [:username, :password, :password_confirmation, :email, :role]
      }

      response '201', 'User created' do
        schema '$ref' => '#/components/schemas/User'
        run_test!
      end

      response '422', 'Invalid user parameters' do
        schema '$ref' => '#/components/schemas/Error'
        run_test!
      end
    end
  end

  path '/projects' do
    get 'Returns all projects' do
      tags 'Projects'
      produces 'application/json'

      response '200', 'OK' do
        schema type: :array,
               items: { '$ref' => '#/components/schemas/Project' }
        run_test!
      end
    end

    post 'Creates a project' do
      tags 'Projects'
      consumes 'application/json'
      produces 'application/json'
      parameter name: :project, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          description: { type: :string }
        },
        required: [:name]
      }

      response '201', 'Project created' do
        schema '$ref' => '#/components/schemas/Project'
        run_test!
      end

      response '422', 'Invalid project parameters' do
        schema '$ref' => '#/components/schemas/Error'
        run_test!
      end
    end
  end
end