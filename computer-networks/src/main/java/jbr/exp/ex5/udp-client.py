import socket

# Get the hostname and IP address (localhost for this case)
hostname = socket.gethostname()
ipaddr = "127.0.0.1"

# Create a UDP socket
s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)

# Define server address and port
addr = (ipaddr, 1234)

# Start communication loop
c = "y"
while c.lower() == "y":
    req_domain = input("Enter domain name for which the IP is needed: ")
    
    # Send the request
    s.sendto(req_domain.encode(), addr)
    
    # Receive response
    data, address = s.recvfrom(1024)
    reply_ip = data.decode().strip()
    
    # Display result
    print(f"The IP for the domain name '{req_domain}' is: {reply_ip
