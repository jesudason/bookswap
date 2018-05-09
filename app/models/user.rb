class User < ApplicationRecord
    has_secure_password	
    validates_presence_of :first_name, :last_name, :email, :address, :country, :suburb, :username, :password, :profile_url
    validates_uniqueness_of :email, :case_sensitive => false
    validates :password, confirmation: { case_sensitive: true }

end
