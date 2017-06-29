require 'features_helper'

describe 'List users' do
  let(:repository) { UserRepository.new }
  
  before do
    repository.clear

    repository.create(name:"Foo", email:"foo@mail.com", type:"standard", hashed_pass:"secret_1")
    repository.create(name:"Bar", email:"bar@mail.com", type:"standard", hashed_pass:"secret_2")
  end

  it 'Lists users' do
    visit '/users'

    within '#users' do
      assert page.has_css?('.user', count: 2), 'Expected to find two users'
    end
  end
end