require 'spec_helper'
require_relative '../../../../apps/web/views/users/index'

describe Web::Views::Users::Index do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/index.html.erb') }
  let(:view)      { Web::Views::Users::Index.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'Lists users' do
    visit '/users'

    within '#users' do
    	assert page.has_css?('.user', count: 2), 'Expected to find two users'
    end
  end
end
