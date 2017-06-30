require 'spec_helper'
require_relative '../../../../apps/web/views/users/new'

describe Web::Views::Users::New do
	let(:params) 		{ Hash[] }
  let(:exposures) { Hash[params: params] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/users/new.html.erb') }
  let(:view)      { Web::Views::Users::New.new(template, exposures) }
  let(:rendered)  { view.render }

  describe 'when page is rendered' do
    it 'form must be present' do
      rendered.scan(/class="user-form"/).count.must_equal 1
      rendered.must_include('Name')
      rendered.must_include('Email')
      rendered.must_include('Password')
      rendered.must_include('Sign up') 
    end
  end
end
