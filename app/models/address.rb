class Address < ApplicationRecord
  validates_uniqueness_of :default, if: :default, :message => "Ya tienes una dirección predeterminada."
  belongs_to :user
end
