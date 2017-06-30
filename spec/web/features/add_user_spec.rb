require 'features_helper'

describe 'Add an user' do
	after do 
		UserRepository.new.clear
	end

	it 'can create a new user' do
		visit '/users/new'

		within 'form#user-form' do
			fill_in 'Name', with: 'Foo'
			fill_in 'Email', with: 'foo@mail.com'
			fill_in 'Password', with: 'secret123'

			click_button 'Sign up'
		end

		current_path.must_equal('/users')
		assert page.has_content?('Foo')
	end

end