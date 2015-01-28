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

  it("will provide the results that are between the provided search parameters") do
    test_product = Product.create({:name => "Silly Pumpkin", :price => 4.50})
    test_purchase = Purchase.create({:date => "2015/02/01", :product_ids => [(test_product.id())]})
    test_product1 = Product.create({:name => "Silly Pumpkin", :price => 4.50})
    test_purchase1 = Purchase.create({:date => "2015/01/01", :product_ids => [(test_product1.id())]})
    expect(Purchase.between("2015-02-01", "2015-02-02").to(eq(test_purchase)))
  end
end
