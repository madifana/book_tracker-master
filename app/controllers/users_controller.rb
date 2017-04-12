class UsersController < ApplicationController

	get '/users/:slug' do
		if !logged_in?
			redirect to '/login'
		else
			@user = User.find_by_slug(params[:slug])
			erb :"users/show"
		end
	end


	get '/signup' do 
		if logged_in?
			redirect '/users/#{create_user.slug}'
		else
			erb :'users/create_user'
		end
	end

	post '/signup' do 
		if params["username"] == "" || params[:password] == "" || params[:email] == ""
			redirect '/signup'
		else
			@user = User.new(username: params[:username], email: params[:email], password: params[:password])
			@user.save
			session[:user_id] = @user.id 
			redirect '/users/#{current_user.slug}'
		end
	end

	get '/login' do 
		if logged_in?
			redirect '/users/#{current_user.slug}'
		else
			erb :'/users/login'
		end
	end

	post '/login' do 
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id 
			redirect '/current_user.slug'
		else
			redirect '/signup'
		end
	end

	get '/logout' do 
		if logged_in?
			session.clear
			redirect '/login'
		else
			redirect '/'
		end
	end
end