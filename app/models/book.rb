class Book < ApplicationRecord
  validates_presence_of :title, :message => "Debes ingresar el título."
  validates_presence_of :author_first_name, :message => "Debes poner el primer nombre del autor o autora."
  validates_presence_of :author_last_name, :message => "Debes poner el apellido del autor o autora."
  validates_presence_of :price, :message => "Debes poner el precio. "
  validates_presence_of :isbn, :message => "Debes poner el ISBN."
  validates_presence_of :synopsis, :message => "Debes escribir la sinópsis."
  validates_presence_of :pvp, :message => "Debes ingresar el PVP."
  belongs_to :publisher
  has_many :comments
  has_and_belongs_to_many :genres
  has_many :orders
  has_many :users, through: :orders
  mount_uploader :cover, CoverUploader
end
