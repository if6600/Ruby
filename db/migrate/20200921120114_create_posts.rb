class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      prepare_columns(t)
    end
  end

  protected

  def prepare_columns(t)
    t.string :title
    t.text :content
    t.string :image
    t.boolean :is_published, :default => false
    t.timestamps
  end

end
