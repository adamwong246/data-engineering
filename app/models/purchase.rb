require 'csv'

class Purchase < ActiveRecord::Base
  attr_accessible :count, :purchaser, :item, :merchant

  belongs_to :purchaser
  belongs_to :merchant
  belongs_to :item

  def self.paramters_from_csv(params)
  def self.parameters_from_csv(params)
    CSV.new(params[:csv].read, headers: true, :col_sep => "\t")
    .to_a
    .map{|row|
      {
        count: row["purchase count"].to_i
      }
    }
  end

end
