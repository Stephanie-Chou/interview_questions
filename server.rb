require 'socket'

server = TCPServer.open(2000)  # Socket to listen on port 2000
loop {                         # Servers run forever
	puts 'banana'
  client = server.accept       # Wait for a client to connect
  puts "Hey. Someone Connected. Say Something back"
  response = gets.chomp
  if response == 'close'
  	client.puts "Closing the connection. Bye!"
  	client.close                 # Disconnect from the client
  else
  	client.puts(Time.now.ctime)  # Send the time to the client
	  client.puts(response)
	end

}