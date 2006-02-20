class DropAwardsBooks < ActiveRecord::Migration
  def self.up
    drop_table :awards_books
    remove_column :awards, :award
    add_column :awards, :book_id, :integer, :null => false
    add_column :awards, :category, :string, :null => false
    add_column :awards, :year, :date, :null => false
    add_column :awards, :status, :string, :null => false
    
    execute 'ALTER TABLE awards ADD CONSTRAINT fk_awards_books FOREIGN KEY ( book_id ) REFERENCES books( id )'

  end

  def self.down
    create_table "awards", :force => true do |t|
      t.column "award", :string
      t.column "organisation", :string
      t.column "award_type", :string
      t.column "award_country", :string
      t.column "award_region", :string
      t.column "award_city", :string
    end
    add_column :awards, :award, :string
    remove_column :awards, :book_id
    remove_column :awards, :category
    remove_column :awards, :year
    remove_column :awards, :status
  end
end
