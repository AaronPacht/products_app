# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
Review.delete_all
User.delete_all

pro1=Product.create(name:"Motercycle",price:200,description:"Has two wheels",url:"https://images.unsplash.com/photo-1627530930207-983280fd1d0f?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
pro2=Product.create(name:"Laptop",price:500,description:"Very small",url:"https://images.unsplash.com/photo-1593642531955-b62e17bdaa9c?ixid=MnwxMjA3fDF8MHxlZGl0b3JpYWwtZmVlZHwzN3x8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
pro3=Product.create(name:"Mona Lisa",price:100000,description:"Definitely real",url:"https://images.unsplash.com/photo-1627889465154-957c19727b11?ixid=MnwxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxOXx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60")
user1=User.create(username:"michael",password:"michael")
user2=User.create(username:"jackson",password:"jackson")
user3=User.create(username:"jonathan",password:"jonathan")
rev1=Review.create(stars:3,message:"I like motercycles",product_id:pro1.id,user_id:user1.id)
rev2=Review.create(stars:5,message:"I was looking for a small laptop, and this was perfect",product_id:pro2.id,user_id:user2.id)
rev3=Review.create(stars:0,message:"Definitely not real",product_id:pro3.id,user_id:user3.id)