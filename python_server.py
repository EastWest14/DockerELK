import time
import BaseHTTPServer
import socket 

HOST_NAME = socket.gethostname()
PORT_NUMBER = 8000
  
class MyHandler(BaseHTTPServer.BaseHTTPRequestHandler):
      def do_GET(s):
         s.send_response(200)
         s.send_header("Content-type", "text/html")
         s.end_headers()
         s.wfile.write("<html><head><title>Title goes here.</title></head>")
         s.wfile.write("<body><p>This is a test.</p>")
         # If someone went to "http://something.somewhere.net/foo/bar/",
         # then s.path equals "/foo/bar/".
         s.wfile.write("<p>You accessed path: %s</p>" % s.path)
         s.wfile.write("</body></html>")

if __name__ == '__main__':
   server_class = BaseHTTPServer.HTTPServer
   httpd = server_class((HOST_NAME, PORT_NUMBER), MyHandler)
   print time.asctime(), "Server Starts - %s:%s" % (HOST_NAME, PORT_NUMBER)
   httpd.serve_forever()
