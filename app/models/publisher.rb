class Publisher < ApplicationRecord
  validates_uniqueness_of :publisher_id
  belongs_to :user
end
