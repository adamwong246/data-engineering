class AddIdsToPurchases < ActiveRecord::Migration
  def change
    add_column :purchasers, :purchase_id, :integer
    add_column :items, :purchase_id, :integer
    add_column :merchants, :purchase_id, :integer
  end
end
