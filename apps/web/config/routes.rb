# Configure your routes here
# See: http://hanamirb.org/guides/routing/overview/
#
# Example:
# get '/hello', to: ->(env) { [200, {}, ['Hello from Hanami!']] }
post '/users', to: 'users#create'
get '/users/new', to: 'users#new'
get '/users', to: 'users#index'

root to: 'home#index'