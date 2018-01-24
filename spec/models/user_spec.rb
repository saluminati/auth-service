require 'rails_helper'

RSpec.describe User, type: :model do
    before do
        @user = FactoryBot.create(:v1_user)
    end

    it 'creates a valid user' do
        @user.valid?
        expect(@user).to be_valid
    end

    it 'does not validate the user if email is not provided or invalid' do
        @user.email = '@notvalidemail.com'
        @user.valid?
        expect(@user.errors[:email]).to include('is invalid')
    end

    it 'does not validate the user if the password is blank' do
        @user.password = nil
        @user.valid?
        expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'does not validate the user if the password_confirmation is not provided' do
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("can't be blank")
    end

    it 'does not validate the user if the password does not match with password_confirmation' do
        @user.password_confirmation = 'somethingElse'
        @user.valid?
        expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end
end
