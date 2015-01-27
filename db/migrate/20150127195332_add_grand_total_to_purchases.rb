class AddGrandTotalToPurchases < ActiveRecord::Migration
  def change
    add_column(:purchases, :grand_total, :decimal, precision: 7, scale: 2)
  end
end
