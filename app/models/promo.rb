class Promo < ApplicationRecord
  scope :filter_by_user, ->(user) { where user: user }
  scope :filter_by_starts_with, ->(name) { where('name like ?', "%#{name}%") }
  scope :filter_by_is_published, ->(is_published) { where is_published: is_published }
  acts_as_taggable_on :tags


  validates :title, presence: true,
                    length: { minimum: 5 }

  has_many :comments, dependent: :destroy

  belongs_to :user

  mount_uploader :image, ImageUploader
end
