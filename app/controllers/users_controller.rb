class UsersController < ApplicationController
	get '/signup' do 
		if logged_in?
			redirect '/books'
		else
			erb :'users/create_user'
		end
	end
end