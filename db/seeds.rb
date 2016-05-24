# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
FactoryGirl.create(:country)
FactoryGirl.create(:address)
FactoryGirl.create(:order)
FactoryGirl.create(:book)
FactoryGirl.create(:category)
FactoryGirl.create(:author)
FactoryGirl.create(:rating)
FactoryGirl.create(:credit_card)
FactoryGirl.create(:order_item)
FactoryGirl.create(:customer)




