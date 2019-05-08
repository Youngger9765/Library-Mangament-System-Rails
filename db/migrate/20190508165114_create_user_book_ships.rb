class CreateUserBookShips < ActiveRecord::Migration[5.1]
  def change
    create_table :user_book_ships do |t|
      t.integer :user_id
      t.integer :book_id

      t.timestamps
    end
  end
end
