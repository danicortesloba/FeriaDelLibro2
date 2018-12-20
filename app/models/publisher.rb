class Publisher < ApplicationRecord
  validates_uniqueness_of :user_id
  belongs_to :user
  has_many :books
  has_many :comments
end
