require 'rails_helper'

RSpec.describe 'Groups Pages', type: :feature do
  describe 'index Page' do
    before(:all) do
      user = User.create(
        name: 'Akuma the Akita',
        email: 'doggo@doggo.com',
        password: 'password'
      )

      user.group.create(
        name: 'Food',
        icon: 'food.png'
      )
    end

    before(:each) do
      visit new_user_session_path
      fill_in 'Email', with: 'doggo@doggo.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      click_link 'Food'
    end

    it 'Expects to see Transacitons title' do        
        expect(page).to have_content('Transactions')
    end

    it 'Expects to see New Transactions title' do 
      click_link 'New Transaction'     
      expect(page).to have_content('New Transactions')
    end

    it 'Create a new transaction' do
      click_link 'New Transaction' 
      fill_in 'entity[name]', with: 'Content'
      fill_in 'entity[amount]', with: 25    
      click_button 'Create Transactions'
      expect(page).to have_content('Content')
      expect(page).to have_content(25)
    end
  end
end