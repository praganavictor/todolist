require 'rails_helper'
feature 'User can see all public list' do
	scenario 'Successfully' do
		user = User.create(email: 'victor@email.com', password: 'vi123456')
		List.create(name: 'Learn cook', user_id: user.id)

		visit root_path

		fill_in	'Email', with: 'victor@email.com'
		fill_in 'Password', with: 'vi123456'
		click_on 'Log in'

		expect(page).to have_content('Learn cook')

	end
	
	scenario 'and Private list' do
		user = User.create(email: 'victor@email.com', password: 'vi123456')
		List.create(name: 'Learn cook', user_id: user.id)
		List.create(name: 'Planning my wedding', status: 1, user_id: user.id)

		visit root_path

		fill_in	'Email', with: 'victor@email.com'
		fill_in 'Password', with: 'vi123456'
		click_on 'Log in'

		expect(page).to have_content('Planning my wedding')

	end
end