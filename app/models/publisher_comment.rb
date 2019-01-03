class PublisherComment < ApplicationRecord
  belongs_to :publisher
  belongs_to :user
end
