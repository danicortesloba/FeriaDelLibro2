class Genre < ApplicationRecord
  before_save { self.name = name.titleize }
  has_and_belongs_to_many :books
end
