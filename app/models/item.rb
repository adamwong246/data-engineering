class Item < ActiveRecord::Base
  attr_accessible :description, :price

  has_many :purchases
end
