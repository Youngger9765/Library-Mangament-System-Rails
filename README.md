# README

Ruby on Rails Decal Final Project

Title: eLib

Team Members: Yash Agarwal, Shoumma Shams, Aman Sidhant

Idea: 

Online eBook library where members can borrow an eBook, and admins can handle books and fine members.


Models & Description: 

	•	Books

		o	Has title, author, year, genre, number of copies, and whether it is available for issue
		o	The associations are that it has and belongs to users

	•	Users

		o	Has email, password, and balance
		o	Has amount of money attributed to them to be deducted for fines
		o 	The associations are that it has and belongs to books

	•	Admins

		o	Has email and password



Features:

	•	Admins and users can log in
	•	Users can issue and return books
	•	Users can register
	•	Admins can check what books are borrowed, what books a member has, and can fine members for overdue books
	•	Admins can add and remove books from the library.


Division of Labour:

	•	Yash: models & controllers
	•	Shoumma: views & styling
	•	Aman: models & controllers
