require 'rails_helper'
feature 'User close a task' do
	scenario 'Successfully' do 
		User.create(email: 'victor@email.com', password: 'vi123456')

		visit root_path

		fill_in	'Email', with: 'victor@email.com'
		fill_in 'Password', with: 'vi123456'
		click_on 'Log in'
		
		click_on 'New TodoList'

		fill_in 'Name', with: 'Learn cook'

		fill_in 'Title', with: 'Cook dinner'
		fill_in 'Description', with: 'Make Tabule folowing the recipe'

		click_on 'Save'

		expect(page).to have_content('List saved successfully')
		
		click_on 'Show'

		expect(page).to have_content('Cook dinner')

		click_on 'Close'

		expect(page).to have_content('Task has been close')
		
	end
end