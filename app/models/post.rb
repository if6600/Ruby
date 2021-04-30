require 'elasticsearch/model'
class Post < ApplicationRecord
  scope :filter_by_user, ->(user) { where user: user }
  scope :filter_by_category, ->(category) { where category: category }
  scope :filter_by_starts_with, ->(name) { where('name like ?', "%#{name}%") }

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  searchkick

  validates :name, presence: true
  validates :title, presence: true,
                    length: { minimum: 5 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader
end
