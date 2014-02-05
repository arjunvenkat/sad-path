# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
u1 = User.create({first: "Arjun", last: "Venkataswamy", email: "a@a.com"})
u2 = User.create({first: "Sandy", last: "Weisz", email: "s@s.com"})
u3 = User.create({first: "Frank", last: "Schneider", email: "f@f.com"})
puts "#{User.count} users created"

Roadblock.destroy_all
r1 = Roadblock.create(error_message: "Undefined variable or method", user1_id: u1.id)
r2 = Roadblock.create(error_message: "Syntax error", user1_id: u1.id, user2_id: u2.id)
r3 = Roadblock.create(error_message: "Infinite loop", user1_id: u2.id, user2_id: u3.id)
r4 = Roadblock.create(error_message: "Stupid mistake", user1_id: u3.id, user2_id: u1.id)
puts "#{Roadblock.count} users created"
