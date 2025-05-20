import socket

# IP-to-MAC mapping table (use a dictionary, not a set)
table = {
    "192.168.1.1": "1E.4A.4A.11",
    "192.168.2.1": "5E.51.4B.01",
    "192.168.1.3": "4B.35.CD.32",
    "192.168.4.1": "AF.4D.1G.FF",
    "192.168.3.2": "C3.C5.EE.C2",
    "1E.4A.4A.11": "192.168.1.1",
    "5E.51.4B.01": "192.168.2.1",
    "4B.35.CD.32": "192.168.1.3",
    "AF.4D.1G.FF": "192.168.4.1",
    "C3.C5.EE.C2": "192.168.3.2"
}

# Create a TCP socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Bind the socket to localhost and port 1234
s.bind(("127.0.0.1", 1234))

# Start listening for incoming connections
s.listen()
print("Server is listening on port 1234...")

# Accept client connection
clientsocket, address = s.accept()
print(f"Connection from {address} has been established.")

# Receive data (IP or MAC address)
ip_or_mac = clientsocket.recv(1024).decode("utf-8").strip()

# Look up the address in the table
result = table.get(ip_or_mac, "No entry for given address")

# Send back the result to the client
clientsocket.send(result.encode())

# Close the socket after communication
clientsocket.close()
s.close()
