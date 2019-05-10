class AddPictureUrlToBooks < ActiveRecord::Migration[5.1]
  def change
  	add_column :books, :picture_url, :string
  end
end
