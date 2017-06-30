require 'spec_helper'
require_relative '../../../../apps/web/views/users/create'

describe Web::Views::Users::Create do
  let(:action) { Web::Controllers::Users::Create.new }
  let(:params) { Hash[user: { name: 'Foo', email: 'foo@mail.com', password: 'secret123' }] }
  let(:repository) { UserRepository.new }

  before do
  	repository.clear
  end

  it 'creates a new user' do
    action.call(params)
    user = repository.last

    user.id.wont_be_nil
    user.name.must_equal params.dig(:user, :name)
  end

  it 'redirects the user to the user list' do
  	response = action.call(params)

  	response[0].must_equal 302
  	response[1]['Location'].must_equal '/users'
  end
  
end
