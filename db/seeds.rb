# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
u1 = User.create({first: "Arjun", last: "Venkataswamy", email: "a@a.com", password: "a", password_confirmation: "a"})
u2 = User.create({first: "Sandy", last: "Weisz", email: "s@s.com", password: "s", password_confirmation: "s"})
u3 = User.create({first: "Frank", last: "Schneider", email: "f@f.com", password: "f", password_confirmation: "f"})
# puts "#{User.count} users created"

Roadblock.destroy_all
# r1 = Roadblock.create(error_message: "Undefined variable or method", user1_id: u1.id)
# r2 = Roadblock.create(error_message: "Syntax error", user1_id: u1.id, user2_id: u2.id)
# r3 = Roadblock.create(error_message: "Infinite loop", user1_id: u2.id, user2_id: u3.id)
# r4 = Roadblock.create(error_message: "Stupid mistake", user1_id: u3.id, user2_id: u1.id)
# puts "#{Roadblock.count} roadblocks created"


Check.destroy_all
c1 = Check.create(description: "Re-read your error message", more_info: "Check the line number and the specific error message. If your roadblock doesn't have an error message, type in 'N/A'", input_label: "Paste your error message below, along with the line number", input_example: "SyntaxError in Pages#home - line #12")
c2 = Check.create(description: "Look through nearby code", more_info: "The error message is just a guess, so check your code around the line number from the error message to see if anything looks out of place. If your roadblock doesnt't have a related error message or code snippet, type in 'N/A'", input_label: "Paste your related code snippet below", input_example: "<%= if @next_rbcheck %>")
c3 = Check.create(description: "Describe your roadblock", more_info: "Please use enough detail for someone else to follow along. Describe what you want to happen, what is going wrong, and what you've tried so far.", input_label: "Describe your roadblock", input_example: "I want to loop through a list of users and display their first names. The entire array is getting displayed at the bottom for some reason. I have tried Googling and asking my neighbor.")

# c4 = Check.create(description: "Ask a neighbor")
# c5 = Check.create(description: "Google it")

CheckList.destroy_all
cl1 = CheckList.create(name: "first list")

CheckListItem.destroy_all
cli1 = CheckListItem.create(check_id: c1.id, check_list_id: cl1.id)
cli2 = CheckListItem.create(check_id: c2.id, check_list_id: cl1.id)
cli3 = CheckListItem.create(check_id: c3.id, check_list_id: cl1.id)


Course.destroy_all
co1 = Course.create(name: "Latin Web Dev")

Enrollment.destroy_all
e1 = Enrollment.create(user_id: u1.id, course_id: co1.id, instructor: true)
e2 = Enrollment.create(user_id: u2.id, course_id: co1.id)
e3 = Enrollment.create(user_id: u3.id, course_id: co1.id)

Topic.destroy_all
t1 = Topic.create(name: "Basic HTML/CSS", course_id: co1.id)

# Selects a current topic for the course
co1.current_topic_id = t1.id
co1.save

CourseCheckList.destroy_all
ccl1 = CourseCheckList.create(course_id: co1.id, check_list_id: cl1.id)

# Associates coursechecklist with course
co1.selected_course_check_list_id = ccl1.id
co1.save





