class CreateProperlyNamedJoinTable < ActiveRecord::Migration
  def change
    create_table(:product_purchases) do |t|
      t.integer :product_id
      t.integer :purchase_id
    end
    drop_table (:products_purchases)
  end
end
