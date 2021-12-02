require 'rails_helper'

RSpec.describe 'User', type: :model do
  before(:each) do
    @user = User.new(
      name: 'Akuma the Akita',
      email: 'doggo@doggo.com',
      password: 'password'
    )
  end

  it 'Name should be present' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'Email should be present' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'Password should be present' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  it 'Should be an valid email' do
    @user.email = 'cat'
    expect(@user).to_not be_valid
  end

  it 'Should be an 6 or more letters' do
    @user.password = 'cat'
    expect(@user).to_not be_valid
  end
end
