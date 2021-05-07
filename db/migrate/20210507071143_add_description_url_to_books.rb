class AddDescriptionUrlToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :description_url, :string
  end
end
