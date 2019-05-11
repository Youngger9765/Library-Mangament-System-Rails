class UserBookShip < ApplicationRecord
    belongs_to :book, :counter_cache => :issue_count
    belongs_to :user

end
