require "rails_helper"
module CapybaraHelpers
	def register_user (first_name: "Featurefirstname", last_name: "Featurelastname", email: "feature@test.com", password: "featurepass", password_confirmation: "featurepass")
		visit "/users/new"
		fill_in "user[first_name]", with: first_name
		fill_in "user[last_name]", with: last_name
		fill_in "user[email]", with: email
		fill_in "user[password]", with: password
		fill_in "user[password_confirmation]", with: password_confirmation
		click_button "Register"
	end
	def login_user (email: "feature@test.com", password: "featurepass")
		register_user
		visit "/sessions/new"
		fill_in "email", with: email
		fill_in "password", with: password
		click_button "Log In"
	end
end