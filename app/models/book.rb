class Book < ApplicationRecord
	has_many :user_book_ships
	has_many :users, through: :user_book_ships

	has_many :comments

	# has_many :issue_logs
	# has_many :users, through: :issue_logs


  
end
