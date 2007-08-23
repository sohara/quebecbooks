class DropBooksTranslator < ActiveRecord::Migration
  def self.up
    remove_column :books, :translator
  end

  def self.down
    add_column :books, :translator, :string, :null => true
  end
end
