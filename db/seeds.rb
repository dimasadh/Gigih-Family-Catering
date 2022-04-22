# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Customer.create(email:'halo@email.com')
Customer.create(email:'gigih@email.com')

Category.create(name:'Nasi Goreng')

Menu.create(category_id: 1, name: 'Nasi Goreng Spesial', price: 20000.0, description: 'Nasi di goreng dengan topping ayam goreng dan bakso')

Menu.create(category_id: 1, name: 'Nasi Goreng Seafood', price: 25000.0, description: 'Nasi di goreng dengan topping udang dan cumi')

Order.create(customer_id: 1, total_price: 20000.0, status: 'NEW')
OrderDetail.create(order_id: 1, menu_id: 1, quantity: 1, sum_price: 20000.0)

Order.create(customer_id: 2, total_price: 65000.0, status: 'PAID')
OrderDetail.create(order_id: 2, menu_id: 1, quantity: 2, sum_price: 40000.0)
OrderDetail.create(order_id: 2, menu_id: 2, quantity: 1, sum_price: 25000.0)

Order.create(customer_id: 2, total_price: 25000.0, status: 'CANCELED')
OrderDetail.create(order_id: 2, menu_id: 2, quantity: 1, sum_price: 25000.0)

