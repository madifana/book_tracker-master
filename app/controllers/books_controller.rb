class BooksController < ApplicationController
	
	get '/books/new' do
		if !logged_in?
			redirect '/login'
		else
			erb :'/books/new'
		end
    end

    post '/books' do
		if !logged_in?
			redirect '/login'
		else
			current_user.books.create(title: params[:title], author: params[:author])
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
			@book = Book.find_by_id(params[:id])
			erb :'/books/edit_book'
		end
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