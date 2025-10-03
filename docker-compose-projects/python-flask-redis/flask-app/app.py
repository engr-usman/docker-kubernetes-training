from flask import Flask
import redis

app = Flask(__name__)
r = redis.Redis(host="redis", port=6379)

@app.route("/")
def hello():
    count = r.incr("visits")
    return f"Hello from Flask + Redis! Visit count: {count}"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)