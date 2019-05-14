class Book < ApplicationRecord
	has_many :user_book_ships
	has_many :users, through: :user_book_ships

	has_many :comments

	acts_as_taggable_on :tags

	# has_many :issue_logs
	# has_many :users, through: :issue_logs

	private

	def book_params
	  params.require(:book).permit(:tag_list)
	end

end
