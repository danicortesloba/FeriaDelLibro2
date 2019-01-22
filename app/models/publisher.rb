class Publisher < ApplicationRecord
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
