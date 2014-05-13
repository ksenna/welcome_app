require 'spec_helper'

FactoryGirl.define do
  factory :user do
    email 'xajler@gmail.com'
    password 'x1234567'
    password_confirmation 'x1234567'
    full_name 'Kornelije Sajler'
  end
end

describe User do

	let :user do
		build :user
	end

	subject do
		user
	end

	
	it 'should have users' do
		@user = User.new
		@user.should_not eq(nil)
	end

	# it 'should have an email address' do
	# 	@user = User.new
	# end

	it 'should get new' do
		get :new
		assert_response :success
		assert_not_nil assigns(:users)
	end

	it 'should create a user' do
		assert_difference('User.count') do
			user :create, user: {name: 'Walter'}
		end
		assert_redirected_to user_path(assigns(:user))
	end

	it "should have a password attribute" do
		@user.should respond_to(:password)
	end

	it "should have a password confirmation attribute" do
		@user.should respond_to(:password_confirmation)
	end

end