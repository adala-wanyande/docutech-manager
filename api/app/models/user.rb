class User < ApplicationRecord
  has_secure_password

validates :name, presence: true
validates :email, uniqueness: { case_sensitive: false }, presence: true
validates :password,  presence: true, length: {in: 4..20, messsage: "Password must be between 6 and 20 characters."}
end
