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

	get '/books/:id/edit' do
		if !logged_in?
			redirect '/login'
		else
			@post = Post.find_by_id(params[:id])
			erb :'/books/edit_book'
	end

	patch '/books/:id' do
		if !logged_in?
			redirect '/login'
		else
			@book = Book.find_by_id(params[:id])
			@book.title = params[:title]
			@book.author = params[:author]
			@book.save
			erb :'/books/show_book'
		end
	end

	delete '/books/:id/delete' do
		if !logged_in?
			redirect '/login'
		else
			@book = Book.find_by_id(params[:id])
			@book.delete
			erb :'/books/show_book'
		end
	end
end