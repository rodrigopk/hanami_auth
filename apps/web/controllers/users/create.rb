module Web::Controllers::Users
  class Create
    include Web::Action

    def call(params)
    	password = params[:user][:password]
		  hashed_pass = hashed_password(password)
		  repository = UserRepository.new

		  @user = repository.create(name: params[:user][:name], 
		  													email: params[:user][:email],
		  													type: 'standard', 
		  													hashed_pass: hashed_pass)
		  redirect_to '/users' if !@user.id.nil?
    end
  end
end
