require 'spec_helper'
require_relative '../../../../apps/web/controllers/users/create'

describe Web::Controllers::Users::Create do
  let(:action) { Web::Controllers::Users::Create.new }
  let(:params) { Hash[user: { name: 'Foo', email: 'foo@mail.com', password: 'secret123' }] }

  it 'is successful' do
    response = action.call(params)
    response[0].must_equal 302
  end
end
