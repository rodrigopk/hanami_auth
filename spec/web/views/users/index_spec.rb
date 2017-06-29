require 'spec_helper'
require_relative '../../../../apps/web/views/users/index'

describe Web::Views::Users::Index do
  let(:exposures) { Hash[users: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/index.html.erb') }
  let(:view)      { Web::Views::Users::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #users' do
    view.users.must_equal exposures.fetch(:users)
  end

  describe 'when there are no users' do
    it 'shows a placeholder message' do
      rendered.must_include('<p class="placeholder">There are no users yet.</p>')
    end
  end

  describe 'when there are users' do
    let(:user1) { User.new(name:"Foo", email:"foo@mail.com", type:"standard", hashed_pass:"secret_1") }
    let(:user2) { User.new(name:"Bar", email:"bar@mail.com", type:"standard", hashed_pass:"secret_2") }
    let(:exposures) { Hash[users: [user1,user2]] }

    it 'lists them all' do
      rendered.scan(/class="user"/).count.must_equal 2
      rendered.must_include('Foo')
      rendered.must_include('Bar')
    end

    it 'hides the placeholder message' do
      rendered.wont_include('<p class="placeholder">There are no users yet.</p>')
    end

  end


end
