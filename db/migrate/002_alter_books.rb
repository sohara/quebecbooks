class AlterBooks < ActiveRecord::Migration
  def self.up
    remove_column :books, :acquired_on
    rename_column :books, :note, :extract
  end

  def self.down
    add_column :books, :acquired_on, :date
    rename_column :books, :extract, :note
  end
end
