#!/usr/bin/python3

from ssl import SSLContext, PROTOCOL_TLSv1_2
from http.server import HTTPServer, SimpleHTTPRequestHandler
from base64 import b64encode, b64decode
from zlib import decompress
import sys

try:
    LISTEN_IP = sys.argv[1]
    LISTEN_PORT = int(sys.argv[2])
    USER = sys.argv[3]
    TIMEOUT = int(sys.argv[4])
    KEY1 = sys.argv[5]
    CERT1 = sys.argv[6]
    HASH1 = sys.argv[7]
    KEY2 = sys.argv[8]
    CERT2 = sys.argv[9]
    HASH2 = sys.argv[10]
    PASSWORD = input()
except ValueError | IndexError | EOFError:
    print('Error: please start with https.sh')
    sys.exit(1)

ENCODING = 'utf-8'
PASSWORD = '%s:%s' % (USER, PASSWORD)
HASH_ALG = "sha256//"
AUTH_HEADER = 'Authorization'
AUTH_TYPE = 'Basic '
AUTH_VALUE = AUTH_TYPE + b64encode(bytes(PASSWORD, ENCODING)).decode(ENCODING)

TIMEOUT_SECONDS = TIMEOUT * 60 if TIMEOUT > 0 else None


class BasicAuthHandler(SimpleHTTPRequestHandler):
    def exit_with_headers(self, code, headers):
        headers = [('Content-type', 'text/html')] + headers

        self.send_response(code)

        for key, value in headers:
            self.send_header(key, value)

        self.end_headers()

    def do_HEAD(self):
        self.exit_with_headers(200, [])

    def do_GET(self):
        if AUTH_HEADER not in self.headers or self.headers[AUTH_HEADER] != '%s' % AUTH_VALUE:
            self.exit_with_headers(401, [('WWW-Authenticate',
                                          '%srealm=\"https.server\"' % AUTH_TYPE)])
        else:
            SimpleHTTPRequestHandler.do_GET(self)


def handle_timeout():
    print('Shutdown: no requests since %s minutes.' % TIMEOUT)
    sys.exit(0)


SERVER = HTTPServer((LISTEN_IP, LISTEN_PORT), BasicAuthHandler)
SERVER.timeout = TIMEOUT_SECONDS
SERVER.handle_timeout = handle_timeout

SSL = SSLContext(PROTOCOL_TLSv1_2)
SSL.load_cert_chain(certfile=CERT1, keyfile=KEY1)
SSL.load_cert_chain(certfile=CERT2, keyfile=KEY2)
SSL.set_ciphers(decompress(b64decode(
    b'eJx9kTsOwCAMQ0/E0K+qbgiidmFp7n+XFgkkkjhdGGx4MTGlfIeHY4jE87YHvuNyrCcp+UoFWdN8VPm7YeT2olv0' +
    b'QyOF83TDgnO+E35HOSaDcFMqWjYhhOPHqG7HueF+s7kZ3AimUysOM2CfbpuqS6wKunDqKnC1frHK6YjMDFIMqkrR' +
    b'HDVyUOUGEd6lQzhmvxQv2gE=')).decode(ENCODING))

SERVER.socket = SSL.wrap_socket(sock=SERVER.socket, server_side=True)

print('Serving HTTPS on %s port %s, TIMEOUT %s minutes.' % (LISTEN_IP, LISTEN_PORT, TIMEOUT) +
      ' Login with:\n\n\t%s\n\nor use:\n' % PASSWORD +
      '\n\tcurl -k --pinnedpubkey \"%s%s;%s%s\"' % (HASH_ALG, HASH1, HASH_ALG, HASH2) +
      ' -H \"%s: %s\" https://localhost:%s/\n' % (AUTH_HEADER, AUTH_VALUE, LISTEN_PORT))

while True:
    SERVER.handle_request()
