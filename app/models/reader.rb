class Reader < ApplicationRecord
  validates_presence_of :firstname, :message => "Debes poner tu nombre."
  validates_presence_of :lastname, :message => "Debes poner tu apellido."
  validates_uniqueness_of :user_id, :message => "Ya estás inscrito."
  belongs_to :user
end
