class BooksController < ApplicationController
	
	get '/books/new' do
		if !logged_in?
			redirect '/login'
		else
			erb :new
		end
    end

    post '/books' do
		if !logged_in?
			redirect '/login'
		else
			@post = Post.create(params)
			erb :index
		end
	end

	get '/books' do 
		if !logged_in?
			redirect '/login'
		else
			@books = Book.all
			erb :'/books/books'
		end
	end
end