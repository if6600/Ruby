require_relative '20200921120114_create_posts.rb'

class CreatePromos < CreatePosts
  def change
    create_table :promos do |t|
      prepare_columns(t)
    end
  end

  def up
    change_column_default :promos, :is_published, true
  end
end
