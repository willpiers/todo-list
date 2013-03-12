# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


tasks = ["this is a to do that needs to get done", "walk the dog", "study for chemistry", "get my girlfriend some stuff", "practice my ruby skills", "write thank you note to grandpa for birthday", "get ingredients to make lasagna"].shuffle

tasks.each do |task|
	t = Task.new
	t.description = task
	t.save
end

puts "==============="
puts "7 Tasks created"
puts "==============="
