class AddAuthorshipsKind < ActiveRecord::Migration
  def self.up
    add_column :authorships, :kind, :string, {:default => "Author", :null => false}
    Authorship.update_all("kind='Author'")
  end

  def self.down
    remove_column :authorships, :kind
  end
end
