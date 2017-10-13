require 'rails_helper'
feature "user logs in" do
	scenario "user can log in" do
		login_user
		expect(current_path).to eq("/posts")
		expect(page).to have_content("Featurefirstname Featurelastname")
	end
	scenario "no email" do
		login_user email:""
		expect(current_path).to eq("/sessions/new")
		expect(page).to have_content("Email and password do not match")
	end
	scenario "invalid email" do
		login_user email:"invalidemail"
		expect(current_path).to eq("/sessions/new")
		expect(page).to have_content("Email and password do not match")
	end
	scenario "no password" do
		login_user password:""
		expect(current_path).to eq("/sessions/new")
		expect(page).to have_content("Email and password do not match")
	end
	scenario "wrong password" do
		login_user password:"wrongpassword"
		expect(current_path).to eq("/sessions/new")
		expect(page).to have_content("Email and password do not match")
	end
	scenario "logged in user has logout" do
		login_user
		expect(page).to have_link("Log Out")
	end
	scenario "user can log out" do
		login_user
		click_link "Log Out"
		expect(current_path).to eq("/sessions/new")
	end
	scenario "user not logged in does not have logout button" do
		visit "/sessions/new"
		expect(page).to_not have_link("Log Out")
	end
end