class AddAuthorsTranslator < ActiveRecord::Migration
  def self.up
    add_column :authors, :translator, :string, :null => true
  end

  def self.down
    remove_column :authors, :translator
  end
end
