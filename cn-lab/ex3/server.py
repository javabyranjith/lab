import socket
import sys

# Create a TCP/IP socket
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the address and port
server_address = ('localhost', 10000)
server.bind(server_address)

# Listen for incoming connections
server.listen(1)
print("Waiting for a connection...")

# Accept a connection
connection, client_address = server.accept()
print("Connection established:", client_address)

# Receive data and echo it back
data = connection.recv(1000)
print("Received:", data.decode())

connection.sendall(data)

# Clean up the connection
connection.close()
server.close()
