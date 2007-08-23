class CreateAuthorsFromTranslators < ActiveRecord::Migration
  def self.up
    Book.find(:all, :conditions => "translator !=''").each do |b|
      author = Author.create(:first_name => b.translator.split(' ')[0], :last_name => b.translator.sub(b.translator.split(' ')[0],"").lstrip)
      Authorship.create(:author => author, :book => b, :kind => "Translator")
    end
  end

  def self.down
    Authorship.find(:all, :conditions => "kind = 'Translator'").each do |a|
      author_id = a.author_id
      a.destroy
      Author.find(author_id).destroy
    end
  end
end
