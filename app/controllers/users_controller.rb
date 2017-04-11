class UsersController < ApplicationController
	get '/signup' do 
		if logged_in?
			redirect '/books'
		else
			erb :'users/create_user'
		end
	end

	post '/signup' do 
		if params["username"] == "" || params[:password] == "" || params[:email] ""
			redirect '/signup'
		else
			@user = User.new(username: params[:username], email: params[:email], password: params[:password])
			@user.save
			session[:user_id] = @user.id 
			redirect '/books'
		end
	end

	get '/login' do 
		if logged_in?
			redirect '/books'
		else
			erb :'/users/login'
		end
	end
end