class AddAuthor1ToPost < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :author1, :string
  end
end
