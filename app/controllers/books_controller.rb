class BooksController < ApplicationController
	
	def	index
		@q = Book.ransack(params[:q])
		@books = @q.result(distinct: true)
		@books = @books.page(params[:page]).per(10) 

	end
	
	def show
		@book =  Book.find(params[:id])
		@new_post =Post.new
  	end
	
	def issue
		@book = Book.find(params[:id])
		if @book.avail_for_issue
			UserBookShip.create(:user => current_user, :book => @book)
			IssueLog.create(:user => current_user, :book => @book, :action => "借書")
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
		ship = UserBookShip.find_by(:user_id => current_user.id, :book_id => @book.id)
		if ship.present?
			ship.delete
			@book.no_copies = @book.no_copies + 1
			if @book.no_copies > 0
				@book.avail_for_issue = true
			end
			@book.save

			IssueLog.create(:user_id => current_user.id, :book_id => @book.id, :action => "還書")
		end
		redirect_to users_main_path(current_user)
	end
	
	def new
		@book = Book.new
	end
	
	def create
		@book = Book.create( 
			title: params[:book][:title], 
			author: params[:book][:author], 
			genre: params[:book][:genre], 
			no_copies: params[:book][:no_copies], 
			avail_for_issue: true
		)
		@book.save
		redirect_to admins_main_path
	end

	def delete
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to admins_main_path
	end
end
