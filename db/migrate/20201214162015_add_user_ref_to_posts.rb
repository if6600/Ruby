class AddUserRefToPosts < ActiveRecord::Migration[6.0]
  def change
    add_reference :posts, :user, null: false, foreign_key: true
    add_reference :promos, :user, null: false, foreign_key: true
  end
end
