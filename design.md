start with service you are providing and work down from there
user driven

ex: how would you implement time slots - maximize # reservations at any given time


#design a chat app

	users can send messages to one another
	users can add other users to a converation

	conversations can have more than 2 users


	## relationships

	User: has_many conversations, has_many messages
	name

	Message: has_many conversations, belongs_to user
	user_id
	conversation_id

	Conversation: has_many messages has_many users
	user1_id
	user2_id

	## routes

	- view conversation
		users/user_id/conversations/conversation_id
	- view all of a single user's converations
		users/user_id/conversations

	implement using polling?

#design opentable

	## relationships

	User: has_many reservations
	name

	Reservation: belongs_to user, belongs_to restaurant
	user_id
	restaurant_id
	table_id
	size
	time/date

	Restaurant: has_many reservations
	name
	num_seats


	how to know when there is time for a reservation
	At any time and date of a restaurant- know how many seats are available.

#design system for elevator