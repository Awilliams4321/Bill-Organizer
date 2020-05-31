class User < ActiveRecord::Base 
    validates :username, :email, :password, presence: true
    has_secure_password
    has_many :bills
end 