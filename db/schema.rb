# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20101001033308) do

  create_table "authors", :force => true do |t|
    t.string    "first_name"
    t.string    "last_name"
    t.string    "other_name"
    t.string    "language"
    t.string    "nationality"
    t.date      "born_on"
    t.string    "birthplace"
    t.date      "died_on"
    t.string    "sex",         :limit => 10
    t.string    "web_site"
    t.text      "biography"
    t.text      "note"
    t.timestamp "created_on",                :null => false
    t.timestamp "updated_on",                :null => false
  end

  create_table "authorships", :force => true do |t|
    t.integer "author_id", :limit => 2
    t.integer "book_id",   :limit => 2
    t.string  "kind",                   :default => "Author", :null => false
  end

  add_index "authorships", ["author_id"], :name => "fk_ab_author"
  add_index "authorships", ["book_id"], :name => "fk_ab_book"

  create_table "awards", :force => true do |t|
    t.integer "book_id",  :default => 0,  :null => false
    t.string  "category", :default => "", :null => false
    t.integer "year",     :default => 0,  :null => false
    t.string  "status",   :default => "", :null => false
  end

  add_index "awards", ["book_id"], :name => "fk_awards_books"

  create_table "books", :force => true do |t|
    t.string    "language"
    t.string    "title"
    t.string    "subtitle"
    t.string    "category",             :limit => 12
    t.string    "topic"
    t.integer   "copyright_year",       :limit => 2
    t.string    "isbn_number"
    t.string    "place_of_publication"
    t.integer   "date_published",       :limit => 2
    t.integer   "edition_number",       :limit => 1
    t.string    "cover_type",           :limit => 12
    t.integer   "page_count",           :limit => 2
    t.integer   "shelf_number",         :limit => 2
    t.text      "abstract"
    t.text      "extract"
    t.timestamp "created_on",                         :null => false
    t.timestamp "updated_on",                         :null => false
  end

  create_table "books_publishers", :id => false, :force => true do |t|
    t.integer "book_id",      :limit => 2
    t.integer "publisher_id", :limit => 2
  end

  add_index "books_publishers", ["book_id"], :name => "fk_bp_book"
  add_index "books_publishers", ["publisher_id"], :name => "fk_bp_publisher"

  create_table "images", :force => true do |t|
    t.integer   "author_id",          :limit => 2
    t.integer   "book_id",            :limit => 2
    t.string    "old_file_name",      :limit => 100
    t.string    "caption"
    t.timestamp "created_at",                        :null => false
    t.string    "image_file_name"
    t.string    "image_content_type"
    t.integer   "image_file_size"
    t.datetime  "image_updated_at"
  end

  add_index "images", ["author_id"], :name => "fk_images_author"
  add_index "images", ["book_id"], :name => "fk_images_book"

  create_table "publishers", :force => true do |t|
    t.string "publisher_name"
    t.string "publisher_code"
    t.string "web_site"
    t.text   "note"
  end

  create_table "users", :force => true do |t|
    t.string "name",            :limit => 100, :default => "", :null => false
    t.string "hashed_password", :limit => 40
  end

end
