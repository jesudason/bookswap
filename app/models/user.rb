class User < ApplicationRecord
    has_secure_password	
    validates_presence_of :first_name, :last_name, :email, :address, :country, :suburb, :username, :password, :profile_url
    # validates_uniqueness_of :name, :case_sensitive => false

end
