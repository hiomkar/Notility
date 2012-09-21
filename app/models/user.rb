class User < ActiveRecord::Base
  attr_accessible :name, :email
  #has_secure_password
  has_many :notes, dependent: :destroy
end
