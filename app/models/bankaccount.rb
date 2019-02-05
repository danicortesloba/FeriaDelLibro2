class Bankaccount < ApplicationRecord
  validates_presence_of :name, :message => "Debes ingresar un nombre."
  validates_presence_of :bank, :message => "Debes ingresar un banco."
  validates_presence_of :accounttype, :message => "Debes ingresar el tipo de cuenta."
  validates_presence_of :rut, :message => "Debes ingresar un rut."
  validates_presence_of :account, :message => "Debes ingresar un número de cuenta."
  validates_presence_of :email, :message => "Debes ingresar una dirección de correo electrónico."
  belongs_to :user
end
