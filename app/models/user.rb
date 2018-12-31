class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates_uniqueness_of :email
  has_one :publisher
  has_one :reader
  has_many :comments
  has_many :addresses
  enum role: [:editorial, :lector]
end
