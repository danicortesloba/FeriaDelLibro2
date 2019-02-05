class PublisherComment < ApplicationRecord
  validates_presence_of :content, :message => "Debes escribir el comentario."
  belongs_to :publisher
  belongs_to :user
end
