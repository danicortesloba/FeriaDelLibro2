class Reader < ApplicationRecord
  validates_uniqueness_of :user_id, :message => "Ya estás inscrito."
  belongs_to :user
end
