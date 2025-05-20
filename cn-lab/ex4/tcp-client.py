import socket
import sys

# Create a TCP/IP socket
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the server
server_address = ('localhost', 1000)
client.connect(server_address)
print("Connecting to port", server_address)

# Start communication loop
message = input("Enter message (type 'end' to quit): ")
client.sendall(message.encode())

while message != "end":
    data = client.recv(1000).decode()

    if data:
        print("Server:", data)
        message = input("Enter message (type 'end' to quit): ")
        client.sendall(message.encode())
    else:
        break

client.close()
