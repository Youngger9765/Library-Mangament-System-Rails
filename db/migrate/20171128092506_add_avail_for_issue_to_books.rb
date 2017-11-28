class AddAvailForIssueToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :avail_for_issue, :boolean
  end
end
