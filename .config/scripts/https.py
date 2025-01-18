import http.server
import ssl
import socketserver
from rich import print

# To genereate cert for server
# openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365

CERT = "/home/fr3d/.config/python3/cert.pem"
KEY = "/home/fr3d/.config/python3/key.pem"
IP = '127.0.0.1'
PORT = 443

context = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)

context.load_cert_chain(CERT, keyfile=KEY, password=None)

server_address = (IP, PORT)  # CHANGE THIS IP & PORT

handler = http.server.SimpleHTTPRequestHandler

with socketserver.TCPServer(server_address, handler) as httpd:
    httpd.socket = context.wrap_socket(httpd.socket,
                                       server_side=True)
    try:
        print("[bold red]Running[/bold red]")
        httpd.serve_forever()
    except KeyboardInterrupt:
        print('[bold blue]nope[/bold blue]')
