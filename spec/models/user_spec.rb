require 'rails_helper'

RSpec.describe User, type: :model do
	context "user has all valid fields" do
		it "valid user without confirmation" do
			expect(build(:user)).to be_valid
		end
		it "valid user with password confirmation" do
			expect(build(:user, password_confirmation:"mypassword")).to be_valid
		end
	end
	context "user has invalid field" do
		it "user does not have first name" do
			expect(build(:user, first_name:"")).to be_invalid
		end
		it "user does not have last_name" do
			expect(build(:user, last_name:"")).to be_invalid
		end
		it "user does not have email" do
			expect(build(:user, email:"")).to be_invalid
		end
		it "user has invalid email" do
			expect(build(:user, email:"invalid@email")).to be_invalid
			expect(build(:user, email:"invalid.email")).to be_invalid
		end
		it "user does not have password" do
			expect(build(:user, email:"")).to be_invalid
		end
		it "user password does not match confirmation" do
			expect(build(:user, password_confirmation:"password")).to be_invalid
		end
		it "user does not have password confirmation" do
			expect(build(:user, password_confirmation:"")).to be_invalid
		end
	end
end
