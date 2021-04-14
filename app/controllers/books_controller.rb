class BooksController < ApplicationController

	before_action :authenticate_user!

	def	index
		@q = Book.ransack(params[:q])
		@books = @q.result(distinct: true)
    	@org_id = 1

		if params[:tag] == "true"
			@books = @books.find(params[:books_ids])
		end

		if params[:org_filter].present?
			@org_id = params[:org_filter].to_i
			@org = Organization.find(@org_id)
			@books = @org.books
		end

		@books = @books.page(params[:page]).per(20)
		@tags = Book.tag_counts_on(:tags)
	end

	def show
		@book =  Book.find(params[:id])
		@new_comment =Comment.new(:book_id => @book.id, :user_id => current_user.id)
		@tags_name_array = ActsAsTaggableOn::Tag.all
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
			:score => score
		)
		comment.save

		if score != nil
			activity = '留了一則留言(評分：' + score.to_s + ') 在：'
		else
			activity = '留了一則留言 在：'
		end
		
		post_slack_message(@book, activity, current_user)

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
		# raise
		if @book.avail_for_issue && !@book.users.include?(current_user)
			UserBookShip.create(:user => current_user, :book => @book)
			IssueLog.create(:user => current_user, :book => @book, :action => "借書")

			@book.no_copies = @book.no_copies - 1

			post_slack_message(@book,"借了",current_user)

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

			post_slack_message(@book,"還了",current_user)
		end
		redirect_to users_main_path(current_user)
	end

	def post_slack_message(book,activity,user)
		conn = Faraday.new(url: "https://hooks.slack.com/services/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")

		current_user_name = user.name || user.email
		activity_word = activity
		book_title = book.title
		book_org_name = book.organization.name

		text_word = current_user_name + " " + activity_word + ": " + book_title + " (" + book_org_name + ")"
		conn.post do |req|
		  req.headers['Content-Type'] = 'application/json'
		  req.body = { text: text_word }.to_json
		end
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

	def add_tag
		@book = Book.find(params[:book_id])
		tags = params[:book][:tag_items].reject { |t| t.empty? }

		if tags.present?
			@book.tags.delete_all

			params[:book][:tag_items].each do |tag|
				@book.tag_list.add(tag)
			end

			@book.save!

			ActsAsTaggableOn::Tag.all.where(:taggings_count => 0).delete_all
		end

		redirect_to book_path(@book)
	end

	def tagged
	  if params[:tag].present?
	    @books_ids = Book.tagged_with(params[:tag]).ids
	  else
	    @books = Book.all
	  end

	  redirect_to books_path(:tag => true, :books_ids=>@books_ids)
	end

	def org_filter
	  if params[:org_filter].present?
		  org_id = params[:org_filter]
	  else
	    org_id = 1
	  end

	  @org = Organization.find(org_id)

	  redirect_to books_path(:org_filter => org_id)
	end

	def recommend_book_btn
		user_issue_book_ids = current_user.issue_logs.pluck(:book_id).uniq
		user_issue_book_tags = ActsAsTaggableOn::Tagging.where(:taggable_type => "Book").where(:taggable_id => user_issue_book_ids).pluck(:tag_id).uniq
		user_issue_book_tags_all_books = ActsAsTaggableOn::Tagging.where(:tag_id => user_issue_book_tags).pluck(:taggable_id).uniq
		the_same_tag_never_issue_books = user_issue_book_tags_all_books - user_issue_book_ids

		user_can_issue_books = Book.where.not(:no_copies => 0).where.not(:id=> current_user.books.ids)

		if the_same_tag_never_issue_books.size == 0
			book = user_can_issue_books.sample
		else
			book = user_can_issue_books.where(:id=> the_same_tag_never_issue_books).sample
		end

		book_id = book.id
		book_title = book.title
		respond_to do |format|
		  format.js { render :json => [book_id,book_title], :callback => params[:callback] }
		end
	end


	private

	def book_params
	  params.require(:book).permit({ tag_items: [] })
	end


end
