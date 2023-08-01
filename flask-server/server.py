#! /usr/bin/python3

from flask import Flask, request, jsonify
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.route("/members")
def members():
    return {"members": ["member1", "member2", "member3", "member4"]}

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True)