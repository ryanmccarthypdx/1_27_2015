class CreateJoinTable < ActiveRecord::Migration
  def change
    create_table(:products_purchases) do |t|
      t.integer :product_id
      t.integer :purchase_id
    end    
  end
end
