class BooksController < ApplicationController
	def show
    	@books = Book.all
  	end
	def issue
		@book = Book.find(params[:id])
		if @book.avail_for_issue
			@book.users << current_user
			@book.no_copies = @book.no_copies - 1
			if @book.no_copies < 1
				@book.avail_for_issue = false
			end
			@book.save
		end
		redirect_to users_main_path
	end	
	def return
		@book = Book.find(params[:id])
		@book.no_copies = @book.no_copies + 1
		if @book.no_copies > 0
			@book.avail_for_issue = true
		end
		@book.save
		@book.users.delete(current_user)
		current_user.books.delete(@book)
		redirect_to users_main_path(current_user)
	end
	def new
		@book = Book.new
	end
	def create
		@book = Book.create( title: params[:book][:title], author: params[:book][:author], genre: params[:book][:genre], no_copies: params[:book][:no_copies], avail_for_issue: true)
		@book.save
		redirect_to admins_main_path
	end
	def deleteshow
		@books = Book.all
	end
	def delete
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to admins_main_path
	end
end
