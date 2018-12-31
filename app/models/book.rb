class Book < ApplicationRecord
  belongs_to :publisher
  has_many :comments
  has_and_belongs_to_many :genres
  has_many :orders
  has_many :users, through: :orders
  mount_uploader :cover, CoverUploader
end
