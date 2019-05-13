class BooksController < ApplicationController

	before_action :authenticate_user!

	def	index
		@q = Book.ransack(params[:q])
		@books = @q.result(distinct: true)
	end

	def show
		@book =  Book.find(params[:id])
		@new_comment =Comment.new(:book_id => @book.id, :user_id => current_user.id)
  	end

  	def create_comment
  		@book = Book.find(params[:book_id])
  		@user = current_user
  		content = params[:comment][:content]
  		score = params[:comment][:score].to_i
  		if score == 0
  			score = nil
  		end
  		comment = @user.comments.new(
  			:user_id => @user.id,
  			:book_id => @book.id,
  			:content => content,
  			:score => score)
  		comment.save

  		redirect_to book_path(@book)
  	end

  	def delete_comment
  		@book = Book.find(params[:book_id])
  		comment = Comment.find(params[:comment_id])
  		comment.delete

  		redirect_to book_path(@book)
  	end

	def issue
		@book = Book.find(params[:book_id])
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

	def add_book_img_url
		@book = Book.find(params[:book_id])
		@book.picture_url = params[:book][:picture_url]
		@book.save!

		redirect_to book_path(@book)
	end
end
