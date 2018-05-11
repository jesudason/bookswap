class User < ApplicationRecord
    has_secure_password
    has_many :books

    validates_presence_of :first_name, :last_name, :email, :address, :country, :suburb, :username, :profile_url
    validates_uniqueness_of :email, :case_sensitive => false
    validates :password, confirmation: { case_sensitive: true }

end
