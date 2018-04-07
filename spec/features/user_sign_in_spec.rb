require 'rails_helper'

feature 'User has to log in' do
	scenario 'successfully' do 
		User.create(email: 'victor@email.com', password: 'vi123456')

		visit root_path

		fill_in	'Email', with: 'victor@email.com'
		fill_in 'Password', with: 'vi123456'
		
		click_on 'Log in'

		expect(page).to have_content('Bem vindo')
	end

	scenario 'and has to sign up first' do
		visit root_path

		click_on 'Sign up'

		fill_in	'Email', with: 'beatriz@gmail.com'
		fill_in 'Password', with: 'vi123456'
		fill_in 'Password confirmation', with: 'vi123456'
		click_on 'Sign up'

		expect(page).to have_content('Bem vindo')
	end
end