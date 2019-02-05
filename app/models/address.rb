class Address < ApplicationRecord
  validates_presence_of :title, :message => "Debes ingresar un nombre."
  validates_presence_of :address, :message => "Debes ingresar una dirección."
  validates_presence_of :commune, :message => "Debes ingresar una comuna."
  validates_presence_of :region, :message => "Debes ingresar una región."
  belongs_to :user
end
