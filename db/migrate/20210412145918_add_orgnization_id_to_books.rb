class AddOrgnizationIdToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :organization_id, :integer, :default => 1
  end
end
