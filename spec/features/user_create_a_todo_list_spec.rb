require 'rails_helper'

feature 'User create a todo list' do 
	scenario 'successfully' do 
		User.create(email: 'victor@email.com', password: 'vi123456')

		visit root_path

		fill_in	'Email', with: 'victor@email.com'
		fill_in 'Password', with: 'vi123456'
		click_on 'Log in'
		click_on 'New TodoList'

		fill_in 'Name', with: 'Cook dinner'
		click_on 'Save'

		expect(page).to have_content('List saved successfully')
		expect(page).to have_content('Cook dinner')
	end

	scenario 'and has to fill all the fields' do 
				User.create(email: 'victor@email.com', password: 'vi123456')

		visit root_path

		fill_in	'Email', with: 'victor@email.com'
		fill_in 'Password', with: 'vi123456'
		click_on 'Log in'
		click_on 'New TodoList'

		fill_in 'Name', with: ''
		click_on 'Save'

		expect(page).to have_content('You have to fill all the fields')
	end
end
