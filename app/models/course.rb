class Course < ActiveRecord::Base
  attr_accessible :name
  has_many :notes, dependent: :destroy
end
