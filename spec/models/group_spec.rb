require 'rails_helper'

RSpec.describe 'Groups', type: :model do
  before(:each) do
    @user = User.create(
        name: 'Akuma the Akita',
        email: 'doggo@doggo.com',
        password: 'password'
      )

      @category = Group.create(
        name: 'Food',
        icon: 'food.png',
        user_id: @user.id
      )
  end

  it 'Name should be present' do
    @category.name = nil
    expect(@category).to_not be_valid
  end

  it 'Icon should be present' do
    @category.icon = nil
    expect(@category).to_not be_valid
  end

  it 'Should be valid if all paramaters are correct' do   
    expect(@category).to be_valid
  end  
end
