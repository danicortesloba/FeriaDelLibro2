class Publisher < ApplicationRecord
  validates_presence_of :name, :message => "Debes poner un nombre."
  validates_presence_of :rut, :message => "Debes poner tu rut."
  validates_presence_of :giro, :message => "Debes escribir un giro."
  validates_presence_of :voucher, :message => "Debes seleccionar un tipo de comprobante."
  validates_presence_of :method, :message => "Debes seleccionar tu método de pago."
  validates_presence_of :address, :message => "Debes escribir una dirección."
  validates_presence_of :razon, :message => "Debes escribir una razón social."
  validates_uniqueness_of :user_id, :message => "Ya estás inscrito."
  belongs_to :user
  has_many :books
  has_many :comments
  has_many :publisher_comments
  enum voucher: [:Boleta, :Factura]
  enum method: [:Paypal, :Depósito, :Mach]
  def facebook_link
    'https://facebook.com/' + self.facebook
  end

  def twitter_link
    'https://twitter.com/' + self.twitter
  end
  def instagram_link
    'https://www.instagram.com/' + self.instagram
  end
end
