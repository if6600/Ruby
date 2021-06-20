# require 'elasticsearch/model'
class Post < ApplicationRecord
  scope :filter_by_user, ->(user) { where user: user }
  scope :filter_by_category, ->(category) { where category: category }
  scope :filter_by_starts_with, ->(name) { where('name like ?', "%#{name}%") }
  scope :filter_by_is_published, ->(is_published) { where is_published: is_published }
  acts_as_taggable_on :tags

  # include Elasticsearch::Model
  # include Elasticsearch::Model::Callbacks
  #
  # searchkick

  validates :title, presence: true,
                    length: { minimum: 5 }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  belongs_to :user
  belongs_to :category

  mount_uploader :image, ImageUploader
end
