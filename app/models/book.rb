class Book < ApplicationRecord
	has_many :user_book_ships
	has_many :users, through: :user_book_ships

	has_many :comments

	acts_as_taggable_on :tags

	# has_many :issue_logs
	# has_many :users, through: :issue_logs

	def tag_items
		tags.map(&:name)
	end

	def tag_items=(names)
		self.tags = names.map{|item|
		Tag.where(name: item.strip).first_or_create! unless item.blank?}.compact!
	end

end
