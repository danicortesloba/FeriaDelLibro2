class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :billing, optional:true
end
