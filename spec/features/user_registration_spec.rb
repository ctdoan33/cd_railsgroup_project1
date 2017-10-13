require 'rails_helper'
feature "user creates an account" do
	scenario "all valid info submitted" do
		register_user
		expect(current_path).to eq("/posts")
		expect(page).to have_content("Featurefirstname Featurelastname")
	end
	scenario "user registers with same email" do
		register_user
		register_user first_name: "user2first", last_name: "user2last", password: "anotherpassword", password_confirmation: "anotherpassword"
		expect(current_path).to eq("/users/new")
		expect(page).to have_content("Email has already been taken")
	end
	scenario "no first name" do
		register_user first_name: ""
		expect(current_path).to eq("/users/new")
		expect(page).to have_content("First name can't be blank")
	end
	scenario "no last name" do
		register_user last_name: ""
		expect(current_path).to eq("/users/new")
		expect(page).to have_content("Last name can't be blank")
	end
	scenario "no email" do
		register_user email: ""
		expect(current_path).to eq("/users/new")
		expect(page).to have_content("Email is invalid")
	end
	scenario "invalid email" do
		register_user email: "invalidemail"
		expect(current_path).to eq("/users/new")
		expect(page).to have_content("Email is invalid")
	end
	scenario "no password" do
		register_user password: ""
		expect(current_path).to eq("/users/new")
		expect(page).to have_content("Password can't be blank")
	end
	scenario "password is less than 8 characters" do
		register_user password: "short", password_confirmation: "short"
		expect(current_path).to eq("/users/new")
		expect(page).to have_content("Password is too short (minimum is 8 characters)")
	end
	scenario "no password confirmation" do
		register_user password_confirmation: ""
		expect(current_path).to eq("/users/new")
		expect(page).to have_content("Password confirmation doesn't match Password")
	end
	scenario "password confirmation does not match" do
		register_user password_confirmation: "Anotherpassword"
		expect(current_path).to eq("/users/new")
		expect(page).to have_content("Password confirmation doesn't match Password")
	end
end