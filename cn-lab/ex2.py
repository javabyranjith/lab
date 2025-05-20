import socket

# Create a socket using IPv4 and TCP
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the host on port 80 (HTTP)
s.connect(("aurcc.ac.in", 80))

# Send a proper HTTP GET request
request = b"GET / HTTP/1.1\r\nHost: aurcc.ac.in\r\nAccept: text/html\r\nConnection: close\r\n\r\n"
s.sendall(request)

# Receive and print the response
response = s.recv(4096)
print(response.decode("utf-8"))

# Close the socket
s.close()
