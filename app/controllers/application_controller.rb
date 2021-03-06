require './config/environment'
require 'rack-flash'

class ApplicationController < Sinatra::Base

	configure do 
		set :public_folder, 'public'
		set :views, 'app/views'
		enable :sessions
		set :session_secret, "secret"
		use Rack::Flash, sweep: true
	end

	get '/' do 
		if logged_in?
			redirect to "/users/#{current_user.slug}"
		else
			erb :index
		end
	end

	helpers do 
		def logged_in?
			!!session[:user_id]
		end

		def current_user
			User.find(session[:user_id])
		end
	end
end