class User < ActiveRecord::Base
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence:true, length:{minimum:2}
	validates :email, uniqueness:{case_sensitive:false}, format:{with:EMAIL_REGEX}
	validates :password, presence:true, length:{minimum:8}, on: :create
	has_secure_password
	after_validation do
		self.email = email.downcase
	end
end
