class Genre < ApplicationRecord
  validates_presence_of :name, :message => "Debes poner el nombre del género."
  before_save { self.name = name.titleize }
  has_and_belongs_to_many :books
end
