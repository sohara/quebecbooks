class ChangeYearToInteger < ActiveRecord::Migration
  def self.up
    change_column :awards, :year, :integer, :limit => 4, :null => false
  end

  def self.down
    change_column :awards, :year, :date, :null => false
  end
end
