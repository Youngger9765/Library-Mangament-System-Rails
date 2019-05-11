# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.create([
	{title: 'Kite Runner', author: 'Khaled Housseini' ,genre: 'Drama' ,no_copies: '2', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
	{title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction'  ,no_copies: '3', avail_for_issue: true},
])

Post.create([
	{user_id: 1, book_id: 1, content: "qwertertr", score: 3}
])