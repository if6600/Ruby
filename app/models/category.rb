class Category < ApplicationRecord
  has_many :posts, dependent: :restrict_with_exception
end
