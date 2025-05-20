import socket

# Create a TCP socket
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)

# Connect to server on localhost at port 1234
s.connect(("localhost", 1234))

# Ask user if they want to use ARP or RARP
a = input("ARP or RARP: ").strip().upper()

# Determine which address to send based on choice
if a == "ARP":
    add = input("Enter IP address: ").strip()
elif a == "RARP":
    add = input("Enter MAC address: ").strip()
else:
    print("Invalid choice")
    s.close()
    exit()

# Send the address to the server
s.send(add.encode())

# Receive the result from the server
result = s.recv(1024).decode("utf-8").strip()

# Display the result
if a == "ARP":
    print("MAC address for", add, "is:", result)
else:
    print("IP address for", add, "is:", result)

# Close the socket
s.close()
