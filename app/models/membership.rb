class Membership < ApplicationRecord
  has_many :membership_orders
  has_many :users, through: :membership_orders
end
