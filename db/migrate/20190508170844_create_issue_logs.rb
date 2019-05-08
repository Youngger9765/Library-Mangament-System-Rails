class CreateIssueLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :issue_logs do |t|
      t.integer :user_id
      t.integer :book_id
      t.string :action
      t.timestamps
    end
  end
end
