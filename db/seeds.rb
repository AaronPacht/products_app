# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
Review.delete_all

pro1=Product.create(name:"first",price:4,description:"nice",url:"https://images.unsplash.com/photo-1627530930207-983280fd1d0f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
pro2=Product.create(name:"second",price:8,description:"not nice",url:"https://images.unsplash.com/photo-1593642531955-b62e17bdaa9c?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
rev1=Review.create(user:"bob",stars:3,message:"hi",product_id:pro1.id)
rev2=Review.create(user:"bill",stars:2,message:"tkhgfk",product_id:pro2.id)