class Comment < ApplicationRecord
  belongs_to :publisher
  belongs_to :book
  belongs_to :user
end
