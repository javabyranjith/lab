import socket
import sys

# Create a TCP/IP socket
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the server
server_address = ("localhost", 1000)
client.connect(server_address)

# Get user input
message = input("Enter a message: ")

print("Sending:", message)
client.sendall(message.encode())

# Receive the echoed message from the server
print("ORIGINAL:", message)
data = client.recv(1000).decode()
print("ECHO:", data)

client.close()
