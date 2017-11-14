require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should be valid when the passwords match' do
      @user = User.new(
          first_name: 'riley',
          last_name: 'gowan',
          email: 't.rileygowan@gmail.com',
          password: 'hello',
          password_confirmation: 'hello'
        )
      expect(@user).to be_valid
    end
    it 'should not be valid when the passwords do not match' do
      @user = User.new(
          first_name: 'riley',
          last_name: 'gowan',
          email: 't.rileygowan@gmail.com',
          password: 'hello',
          password_confirmation: 'hey'
        )
      expect(@user).to_not be_valid
    end
    it 'should not be valid when a password is not provided' do
      @user = User.new(
          first_name: 'riley',
          last_name: 'gowan',
          email: 't.rileygowan@gmail.com',
          password: "hey",
          password_confirmation: nil
        )
      expect(@user).to_not be_valid
    end
    it 'should not be valid when an given email already exists in the database' do
      @user1 = User.new(
          first_name: 'riley',
          last_name: 'gowan',
          email: 't.rileygowan@gmail.com',
          password: "hey",
          password_confirmation: 'hey'
        )
      @user1.save!

      @user2 = User.new(
          first_name: 'jim',
          last_name: 'guthrie',
          email: 't.RILEYgowan@gmail.com',
          password: "hey",
          password_confirmation: 'hey'
        )
      expect(@user2).to_not be_valid
    end
    it 'should not be valid if the given password is either too long or too short' do
      @user = User.new(
          first_name: 'rick',
          last_name: 'roll',
          email: 'rickroll@hotmail.com',
          password: 'a',
          password_confirmation: 'a'
        )
      expect(@user).to_not be_valid
    end
    it 'should log in a user regardless of whitespace' do
      @user = User.new(
          first_name: 'rick',
          last_name: 'roll',
          email: '  rickroll@hotmail.com',
          password: 'hello',
          password_confirmation: 'hello'
        )
      expect(@user).to be_valid
    end
  end
  describe '.authenticate_with_credentials' do
    it 'should create a new session if the user exists in the database && password is valid' do
      @user = User.new(
          first_name: 'riley',
          last_name: 'gowan',
          email: 'rileygowan@hotmail.com',
          password: 'hello',
          password_confirmation: 'hello'
        )
      @user.save!
      user = User.authenticate_with_credentials(@user.email, @user.password)
      expect(user).to be_truthy
    end
  end
end
