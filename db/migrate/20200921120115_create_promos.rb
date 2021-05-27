require_relative '20200921120114_create_posts.rb'

class CreatePromos < CreatePosts
  def change
    create_table :promos do |t|
      prepare_columns(t)
    end
  end
end
