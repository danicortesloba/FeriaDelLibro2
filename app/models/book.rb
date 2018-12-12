class Book < ApplicationRecord
  belongs_to :publisher
  has_and_belongs_to_many :genres
  mount_uploader :cover, Cover_Uploader
end
