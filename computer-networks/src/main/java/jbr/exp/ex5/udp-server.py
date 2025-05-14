import socket

# DNS table as a dictionary
dns_table = {
    "www.google.com": "192.165.1.1",
    "www.youtube.com": "192.165.1.2",
    "www.python.org": "192.165.1.3",
    "www.aurcc.ac.in": "192.165.1.4",
    "www.amazon.in": "192.165.1.5",
    "www.gmail.com": "192.165.1.6"
}

# Create a UDP socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

print("Starting server...")

# Bind to localhost and port 1234
s.bind(("127.0.0.1", 1234))

# Start server loop
while True:
    data, address = s.recvfrom(1024)
    print(f"{address} wants to fetch data")

    # Decode the incoming domain name
    domain = data.decode().strip()

    # Get IP from DNS table or return "not found"
    ip = dns_table.get(domain, "not found")

    # Send back the result
    s.sendto(ip.encode(), address)
