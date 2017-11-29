# README

Ruby on Rails Decal Final Project

Title: eLib

Team Members: Yash Agarwal, Shoumma Shams, Aman Sidhant

Idea: 

Online eBook library where members can borrow an eBook for a period of time, and admins can monitor and fine members.


Models & Description: 

	•	Books

		o	Has title, author, year, genre, number of copies and whether it is available for issue
		o	The associaiton is it has and belongs to users

	•	Users

		o	Has email, password and balance
		o	Has amount of money attributed to them to be deducted for fines
		o 	The association is it has and belongs to books

	•	Admins

		o	Has email and password



Features:

	•	Admins and userss can log in
	•	Members can issue and return books
	•	Members can register
	•	Admins can check what books are borrowed, what books a member has, and can fine members for overdue books
	ster (admin is pre-set)
	•	Admins can add books to the libraries and remove books to the libraries.


Division of Labour:

	•	Yash: models & controllers
	•	Shoumma: views & styling
	•	Aman: models & controllers
