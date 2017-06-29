require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/index'

describe Web::Controllers::Users::Index do
  let(:action) { Web::Controllers::Users::Index.new }
  let(:params) { Hash[] }
  let(:repository) { UserRepository.new }

  before do
  	repository.clear

  	@user = repository.create(name:"Foo", email:"foo@mail.com", type:"standard", hashed_pass:"secret_1")
  end

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 200
  end

  it 'exposes all users' do
  	action.call(params)
  	action.exposures[:users].must_equal [@user]
  end

end
