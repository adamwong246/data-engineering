require 'csv'

class Purchase < ActiveRecord::Base
  attr_accessible :count
  attr_accessible :purchaser, :purchaser_attributes
  attr_accessible :item, :item_attributes
  attr_accessible :merchant, :merchant_attributes

  belongs_to :purchaser
  belongs_to :merchant
  belongs_to :item

  accepts_nested_attributes_for :purchaser, :item, :merchant

end
