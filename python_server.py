import time
import BaseHTTPServer
import socket 

HOST_NAME = socket.gethostname()
PORT_NUMBER = 8000
  
class MyHandler(BaseHTTPServer.BaseHTTPRequestHandler):
      def do_GET(s):
         s.send_response(200)
         s.send_header("Content-type", "application/json")
         s.end_headers()
         s.wfile.write("{\"a\": \"value\"}")

if __name__ == '__main__':
   server_class = BaseHTTPServer.HTTPServer
   httpd = server_class((HOST_NAME, PORT_NUMBER), MyHandler)
   print time.asctime(), "Server Starts - %s:%s" % (HOST_NAME, PORT_NUMBER)
   httpd.serve_forever()
