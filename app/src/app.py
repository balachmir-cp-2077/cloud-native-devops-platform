from flask import Flask
import socket
import os

app = Flask(__name__)

@app.route("/")
def home():
    return {
        "application": "Cloud Native DevOps Platform",
        "status": "Running",
        "hostname": socket.gethostname(),
        "environment": os.getenv("APP_ENV", "development")
    }

@app.route("/health")
def health():
    return {
        "status": "healthy"
    }

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)