# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#
Location.create! code: 001, name: "Beijing"
Location.create! code: 002, name: "Shanghai"
Location.create! code: 003, name: "Shenzhen"
