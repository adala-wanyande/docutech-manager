class User < ApplicationRecord
    has_secure_password
    has_many :projects
  
    validates :username, presence: true, uniqueness: true 
    validates :email, presence: true
    validates :role, presence: true
   


    
  end
  