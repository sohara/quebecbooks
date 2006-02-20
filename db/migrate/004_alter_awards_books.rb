class AlterAwardsBooks < ActiveRecord::Migration
  def self.up
    remove_column :awards_books, :id
    change_column :awards_books, :year, :date
    add_column :awards_books, :status, :string
    remove_column :awards, :organisation
    remove_column :awards, :award_type
    remove_column :awards, :award_country
    remove_column :awards, :award_region
    remove_column :awards, :award_city
  end

  def self.down
    add_column :awards_books, :id, :integer
    change_column :awards_books, :year, :integer
    remove_column :awards_books, :status
    add_column :awards, :organisation, :string
    add_column :awards, :award_type, :string
    add_column :awards, :award_country, :string
    add_column :awards, :award_region, :string
    add_column :awards, :award_city, :string
  end
end
