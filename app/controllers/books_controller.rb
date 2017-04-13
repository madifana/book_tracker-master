class BooksController < ApplicationController
	
	get '/books/new' do
		if !logged_in?
			redirect '/login'
		else
			erb :'/books/new'
		end
    end

    post '/books' do
		if params[:title] == "" || params[:author] == ""
			redirect '/books/new'
		else
			current_user.books.create(title: params[:title], author: params[:author])
			redirect to "/users/#{current_user.slug}"
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
		@book = Book.find_by_id(params[:id])

		if params[:title] == "" || params[:author] == ""
			redirect "/books/#{@book.id}/edit"
		else
			@book.title = params[:title]
			@book.author = params[:author]
			@book.save
			redirect to "/users/#{current_user.slug}"
		end
	end

	delete '/books/:id/delete' do
		if !logged_in?
			redirect '/login'
		else
			@book = Book.find_by_id(params[:id])
			@book.delete
			redirect to "/users#{current_user.slug}"
		end
	end
end