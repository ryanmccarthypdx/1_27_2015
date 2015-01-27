require("spec_helper")

describe("Purchase") do
  it("will list out the products that are included within a purchase") do
    test_product = Product.create({:name => "Silly Pumpkin", :price => 4.50})
    test_product1 = Product.create({:name => "Fun Love", :price => 2.50})
    test_purchase = Purchase.create({:date => "2015/01/01", :product_ids => [(test_product.id()), (test_product1.id())]})
    expect(test_purchase.products()).to(eq([test_product, test_product1]))
  end

  it("will provide you the grand total of a purchase") do
    test_product = Product.create({:name => "Silly Pumpkin", :price => 4.50})
    test_product1 = Product.create({:name => "Fun Love", :price => 2.50})
    test_purchase = Purchase.create({:date => "2015/01/01", :product_ids => [(test_product.id()), (test_product1.id())]})
    expect(test_purchase.grand_total()).to(eq(7.00))
  end
end
