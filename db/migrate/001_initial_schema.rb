class InitialSchema < ActiveRecord::Migration
  def self.up

      create_table "authors", :force => true do |t|
        t.column "first_name", :string
        t.column "last_name", :string
        t.column "other_name", :string
        t.column "language", :string
        t.column "nationality", :string
        t.column "born_on", :date
        t.column "birthplace", :string
        t.column "died_on", :date
        t.column "sex", :string, :limit => 10
        t.column "address_line_1", :string
        t.column "address_line_2", :string
        t.column "city", :string
        t.column "region", :string
        t.column "postal_code", :string, :limit => 14
        t.column "country", :string
        t.column "phone_area_code", :string
        t.column "phone", :string
        t.column "fax", :string
        t.column "email", :string
        t.column "web_site", :string
        t.column "biography", :text
        t.column "note", :text
        t.column "created_on", :timestamp
        t.column "updated_on", :timestamp
      end

      create_table "authors_books", :id => false, :force => true do |t|
        t.column "author_id", :integer, :limit => 5
        t.column "book_id", :integer, :limit => 5
      end

      add_index "authors_books", ["author_id"], :name => "fk_ab_author"
      add_index "authors_books", ["book_id"], :name => "fk_ab_book"
      
      execute 'ALTER TABLE authors_books ADD CONSTRAINT fk_ab_author FOREIGN KEY (author_id) REFERENCES authors(id)'
      execute 'ALTER TABLE authors_books ADD CONSTRAINT fk_ab_book FOREIGN KEY (book_id) REFERENCES books(id)'

      create_table "awards", :force => true do |t|
        t.column "award", :string
        t.column "organisation", :string
        t.column "award_type", :string
        t.column "award_country", :string
        t.column "award_region", :string
        t.column "award_city", :string
      end

      create_table "awards_books", :force => true do |t|
        t.column "book_id", :integer, :limit => 5
        t.column "award_id", :integer, :limit => 5
        t.column "year", :integer, :limit => 4
      end

      add_index "awards_books", ["id"], :name => "BookAwardID", :unique => true

      create_table "books", :force => true do |t|
        t.column "language", :string
        t.column "title", :string
        t.column "subtitle", :string
        t.column "category", :string, :limit => 20
        t.column "topic", :string
        t.column "copyright_year", :integer, :limit => 4
        t.column "isbn_number", :string
        t.column "place_of_publication", :string
        t.column "date_published", :integer, :limit => 4
        t.column "edition_number", :integer, :limit => 4
        t.column "cover_type", :string, :limit => 12
        t.column "acquired_on", :date
        t.column "page_count", :integer, :limit => 5
        t.column "shelf_number", :integer, :limit => 5
        t.column "abstract", :text
        t.column "note", :text
        t.column "created_on", :timestamp
        t.column "updated_on", :timestamp
      end

      create_table "books_publishers", :id => false, :force => true do |t|
        t.column "book_id", :integer, :limit => 5
        t.column "publisher_id", :integer, :limit => 5
      end

      add_index "books_publishers", ["book_id"], :name => "fk_bp_book"
      add_index "books_publishers", ["publisher_id"], :name => "fk_bp_publisher"
      
      execute 'ALTER TABLE books_publishers ADD CONSTRAINT fk_bp_book FOREIGN KEY (book_id) REFERENCES books(id)'
      execute 'ALTER TABLE books_publishers ADD CONSTRAINT fk_bp_publisher FOREIGN KEY (publisher_id) REFERENCES publishers (id)'
    

      create_table "images", :force => true do |t|
        t.column "author_id", :integer, :limit => 5
        t.column "book_id", :integer, :limit => 5
        t.column "name", :string, :limit => 100
        t.column "caption", :string
        t.column "created_at", :timestamp
      end

      add_index "images", ["author_id"], :name => "fk_images_author"
      add_index "images", ["book_id"], :name => "fk_images_book"
      
      execute 'ALTER TABLE images ADD CONSTRAINT fk_images_author FOREIGN KEY (author_id) REFERENCES authors(id)'
      execute 'ALTER TABLE images ADD CONSTRAINT fk_images_book FOREIGN KEY (book_id) REFERENCES books (id)'

      create_table "publishers", :force => true do |t|
        t.column "publisher_name", :string
        t.column "publisher_code", :string
        t.column "address_line_1", :string
        t.column "address_line_2", :string
        t.column "city", :string
        t.column "region", :string
        t.column "postal_code", :string
        t.column "country", :string
        t.column "phone", :string
        t.column "fax", :string
        t.column "email", :string
        t.column "web_site", :string
        t.column "note", :text
      end

      create_table "users", :force => true do |t|
        t.column "name", :string, :limit => 100, :default => "", :null => false
        t.column "hashed_password", :string, :limit => 40
      end

    end
    

  def self.down
  end
end
