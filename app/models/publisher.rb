class Publisher < ApplicationRecord
  validates_uniqueness_of :user_id, :message => "Ya estás inscrito."
  belongs_to :user
  has_many :books
  has_many :comments
end
