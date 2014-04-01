# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# User.destroy_all
# u1 = User.create({first: "Arjun", last: "Venkataswamy", email: "a@a.com", password: "arjun", password_confirmation: "arjun"})
# u2 = User.create({first: "Sandy", last: "Weisz", email: "s@s.com", password: "sandy", password_confirmation: "sandy"})
# u3 = User.create({first: "Frank", last: "Schneider", email: "f@f.com", password: "frank", password_confirmation: "frank"})
# puts "#{User.count} users created"

# Roadblock.destroy_all
# r1 = Roadblock.create(error_message: "Undefined variable or method", user1_id: u1.id)
# r2 = Roadblock.create(error_message: "Syntax error", user1_id: u1.id, user2_id: u2.id)
# r3 = Roadblock.create(error_message: "Infinite loop", user1_id: u2.id, user2_id: u3.id)
# r4 = Roadblock.create(error_message: "Stupid mistake", user1_id: u3.id, user2_id: u1.id)
# puts "#{Roadblock.count} roadblocks created"


Check.destroy_all
c1 = Check.create(description: "Re-read your error message", input_label: "Paste in your error message below", input_example: "SyntaxError in Pages#home")
c2 = Check.create(description: "Ask a neighbor")
c3 = Check.create(description: "Google it")

CheckList.destroy_all
cl1 = CheckList.create(name: "first list")

CheckListItem.destroy_all
cli1 = CheckListItem.create(check_id: c1.id, check_list_id: cl1.id)
cli2 = CheckListItem.create(check_id: c2.id, check_list_id: cl1.id)
cli3 = CheckListItem.create(check_id: c3.id, check_list_id: cl1.id)
