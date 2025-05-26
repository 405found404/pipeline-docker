from http.server import BaseHTTPRequestHandler, HTTPServer

class MyHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/":
            self.send_response(200)
            self.send_header("Content-type", "text/html")
            self.end_headers()
            self.wfile.write(b"Hello from the Pipeline Orchestrator!")
        else:
            self.send_response(404)
            self.end_headers()

if __name__ == "_main_":
    server_address = ("0.0.0.0", 5000)
    httpd = HTTPServer(server_address, MyHandler)
    print("Server running on port 5000...")
    httpd.serve_forever()