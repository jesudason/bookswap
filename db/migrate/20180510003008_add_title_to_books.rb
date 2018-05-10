class AddTitleToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :title, :string
    add_column :books, :author, :string
    add_column :books, :plot, :string
    add_column :books, :year, :string
    add_column :books, :rating, :string
    add_column :books, :classification, :string
    add_column :books, :genre, :string
  end
end
