class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates_uniqueness_of :email, :message => "Ya estás inscrito."
  has_one :publisher
  has_one :reader
  has_many :comments
  has_many :publisher_comments
  has_many :addresses
  has_many :orders
  has_many :membership_orders
  has_many :books, through: :orders
  has_many :memberships, through: :membership_orders
  has_many :billings
  has_many :millings
  has_many :bankaccounts
  enum role: [:Editorial, :Lector, :admin]
end
