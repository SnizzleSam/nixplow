class User < ActiveRecord::Base
    validates_presence_of :username, :description
    
    
    has_secure_password
    geocoded_by :address
    after_validation :geocode

    
end
