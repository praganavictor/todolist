require 'rails_helper'
feature 'User can give fav for a list' do
	scenario 'Successfully' do
		user = User.create(email: 'victor@email.com', password: 'vi123456')
		List.create(name: 'Learn cook', user_id: user.id)

		visit root_path

		fill_in	'Email', with: 'victor@email.com'
		fill_in 'Password', with: 'vi123456'
		click_on 'Log in'

		click_on 'Fav'
		expect(page).to have_content('Your list is now on your FavList')
	end
end