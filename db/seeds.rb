# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create([{first_name:'Bob', last_name:'Bobby', email:'bob@bobby.com', password:'password'},
	{first_name:'Santa', last_name:'Claus', email:'santa@claus.com', password:'password'},
	{first_name:'Joe', last_name:'Joey', email:'joe@joey.com', password:'password'},
	{first_name:'Michelle', last_name:'Obama', email:'michelle@obama.com', password:'password'},
	{first_name:'Beyonce', last_name:'Knowles', email:'beyonce@knowles.com', password:'password'}])

Group.create([{name:'Book Club', description:'A new book every week.', user:User.first},
	{name:'Smoothies', description:'Learn how to make some awesome smoothies', user:User.find(2)},
	{name:'Game of Thrones', description:'The official Game of Thrones fan club', user:User.find(3)}])

Member.create([{user:User.first, group:Group.first}, {user:User.find(2), group:Group.find(2)}, {user: User.find(3), group: Group.find(3)}])