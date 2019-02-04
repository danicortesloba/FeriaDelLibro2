class Membership < ApplicationRecord
  validates_presence_of :name, :message => "Debes escribir el nombre."
  validates_presence_of :price, :message => "Debes poner un precio."
  has_many :membership_orders
  has_many :users, through: :membership_orders
end
