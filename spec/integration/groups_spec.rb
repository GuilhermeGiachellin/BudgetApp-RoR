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
    end

    it 'Expects to see category title' do
      expect(page).to have_content('Category')
    end

    it 'Expects to see one category in the index page' do
      expect(page).to have_content('Food')
    end

    it 'Create a new category' do
      click_link 'New Category'
      fill_in 'group[name]', with: 'Games'
      select('Games', from: 'group[icon]')
      click_button 'Create Category'
      expect(page).to have_content('Games')
    end

    it 'Go to a categories details page' do
      click_link 'Food'
      expect(page).to have_content('Transactions')
    end
  end
end
