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
  {username: "Fiorina", password_digest: "p1" },
  {username: "Trump", password_digest: "p2" },
  {username: "Carson", password_digest: "p3" },
  {username: "Clinton", password_digest: "p4" }
]

Profile.create! [
  {gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina", user_id: User.where(username: "Fiorina")[0][:id] },
  {gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump", user_id: User.where(username: "Trump")[0][:id] },
  {gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson", user_id: User.where(username: "Carson")[0][:id] },
  {gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton", user_id: User.where(username: "Clinton")[0][:id] }
]


TodoList.create! [
  {list_due_date: (Date.today +1.year), list_name: "Carly1", user_id: User.where(username: "Fiorina")[0][:id] },
  {list_due_date: (Date.today + 1.year), list_name: "Trump1", user_id: User.where(username: "Trump")[0][:id] },
  {list_due_date: (Date.today + 1.year),list_name: "Carson1", user_id: User.where(username: "Carson")[0][:id] },
  {list_name: "Hillary1", list_due_date: (Date.today +1.year), user_id: User.where(username: "Clinton")[0][:id]}
]

for i in User.pluck(:id) do
  for j in 1..5 do
    TodoItem.create! [
      {title: "Item#{i}#{j}", description: "Description #{i}#{j}", completed: false, due_date: (Date.today + 1.year), todo_list_id: TodoList.where(user_id: i)[0][:id]}
    ]
  end
end
