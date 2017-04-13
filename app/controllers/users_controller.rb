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
			redirect "/users/#{create_user.slug}"
		else
			erb :'users/create_user'
		end
	end

	post '/signup' do
	 	@user = User.new(username: params[:username], email: params[:email], password: params[:password])
	 	if @user.save
			 session[:user_id] = @user.id
		 	redirect "/users/#{current_user.slug}"
	 	else
		 	flash[:message] = @user.errors.full_messages.join(", ")
		 	redirect '/signup'
	 	end
 	end

	get '/login' do 
		if logged_in?
			redirect "/users/#{current_user.slug}"
		else
			erb :'/users/login'
		end
	end

	post '/login' do 
		@user = User.find_by(username: params[:username])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id 
			redirect "/users/#{current_user.slug}"
		else
			flash[:message] = "Invalid username or password."
			redirect '/login'
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