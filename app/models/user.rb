class User < ActiveRecord::Base
	has_many :books
	has_secure_password

	def slug
		username.downcase.strip.gsub(" ","-")
	end
end