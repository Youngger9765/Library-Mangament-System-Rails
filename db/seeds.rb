# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Book.create([{title: 'Kite Runner', author: 'Khaled Housseini' ,genre: 'Drama' ,no_copies: '2', avail_for_issue: true},
			 {title: 'A Thousand Splendid Suns', author: 'Khaled Housseini' ,genre: 'Fiction' , year: '2007' ,no_copies: '3', avail_for_issue: true},
			 {title: 'And the Mountains Echoed', author: 'Khaled Housseini' ,genre: 'Fiction' , year: '2013' ,no_copies: '2', avail_for_issue: true},
			 {title: 'Only Time will tell', author: 'Jefferey Archer' ,genre: 'Fiction' , year: '2011' ,no_copies: '2', avail_for_issue: true},
			 {title: 'Kane and Abel', author: 'Jefferey Archer' ,genre: 'Fiction' , year: '1979' ,no_copies: '2', avail_for_issue: true},
			 {title: 'This was a Man', author: 'Jefferey Archer' ,genre: 'Suspense' , year: '2016' ,no_copies: '4', avail_for_issue: true},
			 {title: 'Best Kept Secret', author: 'Jefferey Archer' ,genre: 'Drama' , year: '2013' ,no_copies: '3', avail_for_issue: true},
			 {title: 'If Tomorrow comes', author: 'Sidney Sheldon' ,genre: 'Crime Fiction' , year: '1985' ,no_copies: '2', avail_for_issue: true},
			 {title: 'Master of the Game', author: 'Sidney Sheldon' ,genre: 'Thriller' , year: '1982' ,no_copies: '1', avail_for_issue: true},
			 {title: 'The Other side of Midnight', author: 'Sidney Sheldon' ,genre: 'Thriller' , year: '1973' ,no_copies: '3', avail_for_issue: true},
			 {title: 'Bloodline', author: 'Sidney Sheldon' ,genre: 'Thriller' , year: '1977' ,no_copies: '2', avail_for_issue: true},
			 {title: 'Memories of Midnight', author: 'Sidney Sheldon' ,genre: 'Fiction' , year: '1990' ,no_copies: '5', avail_for_issue: true}])