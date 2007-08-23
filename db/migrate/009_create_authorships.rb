class CreateAuthorships < ActiveRecord::Migration
  def self.up
    rename_table :authors_books, :authorships
    add_column :authorships, :id, :primary_key, {:null => false}
  end

  def self.down
    remove_column :authorships, :id
    rename_table :authorships, :authors_books
  end
end
