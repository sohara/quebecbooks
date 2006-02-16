class AlterAuthorsPublishers < ActiveRecord::Migration
  def self.up
    remove_column :authors, :address_line_1
    remove_column :authors, :address_line_2
    remove_column :authors, :city 
    remove_column :authors, :region
    remove_column :authors, :postal_code
    remove_column :authors, :country
    remove_column :authors, :phone_area_code
    remove_column :authors, :phone
    remove_column :authors, :fax
    remove_column :authors, :email
    remove_column :publishers, :address_line_1
    remove_column :publishers, :address_line_2
    remove_column :publishers, :city
    remove_column :publishers, :region
    remove_column :publishers, :postal_code
    remove_column :publishers, :country
    remove_column :publishers, :phone
    remove_column :publishers, :fax
    remove_column :publishers, :email
  end

  def self.down
    add_column :authors, :address_line_1, :string
    add_column :authors, :address_line_2, :string
    add_column :authors, :city, :string
    add_column :authors, :region, :string
    add_column :authors, :postal_code, :string, :limit => 14
    add_column :authors, :country, :string
    add_column :authors, :phone_area_code, :string
    add_column :authors, :phone, :string
    add_column :authors, :fax, :string
    add_column :authors, :email, :string
    add_column :publishers, :address_line_1, :string
    add_column :publishers, :address_line_2, :string
    add_column :publishers, :city, :string
    add_column :publishers, :region, :string
    add_column :publishers, :postal_code, :string
    add_column :publishers, :country, :string
    add_column :publishers, :phone, :string
    add_column :publishers, :fax, :string
    add_column :publishers, :email, :string
  end
end
