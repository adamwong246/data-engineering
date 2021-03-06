class Purchaser < ActiveRecord::Base
  attr_accessible :name

  validates_uniqueness_of :name
  validates_presence_of :name

  has_many :purchases
  
end
