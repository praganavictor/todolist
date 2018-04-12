require 'rails_helper'

feature 'User create a todo list private' do
	scenario 'Successfully' do
		user = User.create(email: 'victor@email.com', password: 'vi123456')

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

		click_on "Private"

		expect(page).to have_content('Now your list is a private list')
	end

	scenario 'and turn Public' do
		user = User.create(email: 'victor@email.com', password: 'vi123456')

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
		expect(page).to have_content('Learn cook')
		expect(page).to have_content('Public')
	end
end