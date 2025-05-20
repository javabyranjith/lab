import socket
import sys

# Create a TCP/IP socket
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to the port
server_address = ('localhost', 1000)
server.bind(server_address)

# Listen for a connection
server.listen(1)
print("Waiting for the connection...")

# Accept the connection
connection, client_address = server.accept()
print("Connection established with", client_address)

message = ""

while message != "end":
    data = connection.recv(1000).decode()
    if data:
        print("Client:", data)
        message = input("Enter message (type 'end' to quit): ")
        connection.sendall(message.encode())
    else:
        break

connection.close()
server.close()
