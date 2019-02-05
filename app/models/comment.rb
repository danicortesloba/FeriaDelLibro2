class Comment < ApplicationRecord
  validates_presence_of :content, :message => "Debes poner contenido."
  belongs_to :publisher
  belongs_to :book
  belongs_to :user
end
