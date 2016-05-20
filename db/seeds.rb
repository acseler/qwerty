# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Country.create(name: 'Ukraine')
Address.create(address: 'Street1', zipcode: '1234', city: 'Ololo', phone: '123123')
Address.create(address: 'Street2', zipcode: '5678', city: 'Ofofo', phone: '456456')
Order.create(total_price: 1.22, completed_date: Time.now)
