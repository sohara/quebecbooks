class AddBooksTranslator < ActiveRecord::Migration
  def self.up
     remove_column :authors, :translator
     add_column :books, :translator, :string, :null => true
  end

  def self.down
    remove_column :books, :translator
    add_column :authors, :translator, :string, :null => true
  end
end
