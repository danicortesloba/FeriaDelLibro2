class Milling < ApplicationRecord
  belongs_to :user
  has_many :membership_orders
  def self.created_by_month
    group_by_month(:created_at).count
 end
end
