class Purchase < ActiveRecord::Base
  has_and_belongs_to_many :products
  scope :between, lambda{|start_date, end_date| where("date = :start_date AND date = :end_date", :start_date => start_date, :end_date => end_date)}


  define_method(:products) do
    answers = []
    self.product_ids().each() do |product_id|
      found_product = Product.find(product_id)
      answers.push(found_product)
    end
    answers
  end

  define_method(:grand_total) do
    total = 0
    self.products().each() do |product|
      total += product.price()
    end
    total
  end


end
