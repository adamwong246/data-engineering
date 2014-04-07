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

  def self.parameters_from_csv(params)
    CSV.new(params[:csv].read, headers: true, :col_sep => "\t")
    .to_a
    .map{|row|
      {
        count: row["purchase count"].to_i,
        purchaser_attributes: {
          name: row["purchaser name"]
        },
        item_attributes: {
          description: row["item description"],
          price: row["item_price"]
        },
        merchant_attributes: {
          name: row["merchant name"],
          address: row["merchant address"]
        }
      }
    }
  end

end
