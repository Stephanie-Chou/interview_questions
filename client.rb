require 'socket'

hostname = 'localhost'
port = '2000'

s = TCPSocket.open(hostname, port)

while line = s.gets
	puts line.chop
	if (line.chop == 'Closing the connection. Bye!')
		s.close
	end
end

puts 'hello'

