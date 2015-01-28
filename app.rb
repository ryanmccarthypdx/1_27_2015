require("sinatra")
require("sinatra/reloader")
require("sinatra/activerecord")
also_reload("lib/**/*.rb")
require("./lib/product")
require("./lib/purchase")
require("./lib/product_purchase")
require("pg")
require('pry')

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
  product_ids_array = params.fetch("product_ids_array")
  @purchase = Purchase.create({:date => date, :product_ids => product_ids_array})
  @product_array = @purchase.products()
  @grand_total = @purchase.grand_total()
  erb(:purchase)
end

get('/purchases/:id') do
  @purchase_id = params.fetch("id")
  @purchase = Purchase.find(@purchase_id)
  @product_array = @purchase.products()
  @grand_total = @purchase.grand_total()
  erb(:purchase)
end


# @sorted_dates = Purchase.between(params.fetch(), params.fetch()).all()
