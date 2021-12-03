require 'rails_helper'

RSpec.describe 'Groups', type: :model do
  before(:each) do
    @user = User.create(
      name: 'Akuma the Akita',
      email: 'doggo@doggo.com',
      password: 'password'
    )

    @transacitons = Entity.create(
      name: 'Carne',
      amount: 20,
      user_id: @user.id
    )
  end

  it 'Name should be present' do
    @transacitons.name = nil
    expect(@transacitons).to_not be_valid
  end

  it 'Icon should be present' do
    @transacitons.amount = -2
    expect(@transacitons).to_not be_valid
  end

  it 'Should be valid if all paramaters are correct' do
    expect(@transacitons).to be_valid
  end
end
