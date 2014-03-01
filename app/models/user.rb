class User < ActiveRecord::Base
	
	validates :first_name, :last_name, :email_address, :password, :presence => "true" 
end
