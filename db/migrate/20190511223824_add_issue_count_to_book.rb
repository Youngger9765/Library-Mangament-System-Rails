class AddIssueCountToBook < ActiveRecord::Migration[5.1]
  def change
  	add_column :books, :issue_count, :integer, :default => 0
  end
end
