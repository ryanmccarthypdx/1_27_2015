require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/product")
require("./lib/purchase")
require("./lib/product_purchase")
require("pg")

get('/') do
  @product_list = Product.all()
  @purchase_list = Purchase.all()
  erb(:index)
end

post('/product_add') do
  name = params.fetch('name')
  price = params.fetch('price')
  Product.create({:name => name, :price => price})
  redirect back
end

post('/purchase_add') do
  date = params.fetch('date')
  product_array = params.fetch("product_array")
  grand_total = 0
  product_array.each() do |product_id|
    grand_total += (Product.find(product_id).price())
  end
  new_purchase = Purchase.create({:date => date, :grand_total => grand_total})
  new_purchase_id = new_purchase.id()
  product_array.each() do |product_id|
    Product_Purchase.create({:product_id => product_id, :purchase_id => new_purchase_id })
  end

  redirect back
end
