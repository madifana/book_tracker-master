class User < ActiveRecord::Base
	has_many :books
	has_secure_password
	validates_presence_of :username
	validates :email, :username, uniqueness: true
	validate :is_email_available?, :is_username_available?

	def slug
		username.downcase.strip.gsub(" ","-")
	end

	def self.find_by_slug(slug)
		User.all.find do |u|
			u.slug == slug
		end
	end

	protected

    def is_email_available?
      errors.add(:email, "The email #{email} has already been taken.") if User.find_by(email: email)
    end

    def is_username_available?
        errors.add(:username, "The username #{username} has already been taken.") if User.find_by(username: username)
    end
end