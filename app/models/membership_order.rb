class MembershipOrder < ApplicationRecord
  belongs_to :membership
  belongs_to :user
  belongs_to :milling, optional: true
  scope :cart, (-> {where(paid: false)})
end
