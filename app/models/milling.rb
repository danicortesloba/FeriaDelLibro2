class Milling < ApplicationRecord
  belongs_to :user
  has_many :membership_orders
end
