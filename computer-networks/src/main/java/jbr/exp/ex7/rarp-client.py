import socket

# Create a TCP socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to the server at localhost on port 1234
s.connect(("localhost", 1234))

# Ask the user whether they want to use ARP or RARP
a = input("ARP or RARP: ").strip().upper()

# Get the IP or MAC address from the user based on the choice
if a == "ARP":
    add = input("Enter IP address: ").strip()
elif a == "RARP":
    add = input("Enter MAC address: ").strip()
else:
    print("Invalid choice.")
    s.close()
    exit()

# Send the address to the server
s.send(add.encode())

# Receive the response from the server (IP or MAC address)
mac = s.recv(1024).decode("utf-8").strip()

# Display the result
if a == "ARP":
    print("MAC address for", add, "is:", mac)
else:
    print("IP address for", add, "is:", mac)

# Close the socket after communication
s.close()
