# This will Run the code on Docker file 

from flask import Flask
helloworld = Flask(__name__)
@helloworld.route("/")
def run():
    return "{\"message\":\"This is the 1st Docker Project created on python using flack and deploy using CICD- \"}"
if __name__ == "__main__":
    helloworld.run(host="0.0.0.0", port=int("5000"), debug=True)
