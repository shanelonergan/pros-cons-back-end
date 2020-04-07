class User < ApplicationRecord
    has_many :lists

    validates :username, :email, presence: true
    validates :username, length: { minimum: 3 }
    validates :email, :username, uniqueness: true

    has_secure_password
end
