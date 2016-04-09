# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

User.create! [
	{ username: "Fiorina", password_digest: "Password"},
	{ username: "Trump", password_digest: "Password"},
	{ username: "Carson", password_digest: "Password"},
	{ username: "Clinton", password_digest: "Password"}
]

Profile.create! [
	{first_name: "Carly", last_name: "Fiorina", gender: "female", birth_year: 1954},
	{first_name: "Donald", last_name: "Trump", gender: "male", birth_year: 1946},
	{first_name: "Ben", last_name: "Carson", gender: "male", birth_year: 1951},
	{first_name: "Hillary", last_name: "Clinton", gender: "female", birth_year: 1947}
]

p1 = Profile.find_by last_name: "Fiorina"
u1 = User.find_by username: "Fiorina"
u1.profile = p1

p1 = Profile.find_by last_name: "Trump"
u1 = User.find_by username: "Trump"
u1.profile = p1

p1 = Profile.find_by last_name: "Carson"
u1 = User.find_by username: "Carson"
u1.profile = p1

p1 = Profile.find_by last_name: "Clinton"
u1 = User.find_by username: "Clinton"
u1.profile = p1

u2 = User.all
u2.each do |u| 
	t1 = TodoList.create list_name: u.username, list_due_date: Date.today + 1.year
	u.todo_lists << t1
end

todos = TodoList.all
todos.each do |t|
	for i in 1..5 do 
		item = TodoItem.create title: "title " + t.list_name + i.to_s, description: "desc " + t.list_name + i.to_s, due_date: Date.today + 1.year
		t.todo_items.push(item)
	end
end
  