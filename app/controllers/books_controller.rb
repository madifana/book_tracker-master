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
			erb :'/books/books'
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

	get '/books/:id' do
		if !logged_in?
			redirect '/login'
		else
			@book = Book.find_by_id(params[:id])
			erb :'/books/show_book'
		end
	end
end