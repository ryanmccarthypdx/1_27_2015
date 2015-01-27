class AddPurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
      t.date :date
    end
  end
end
