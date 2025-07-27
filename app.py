from flask import Flask, render_template, request, redirect, url_for

app = Flask(__name__)


@app.route("/", methods=["GET", "POST"])
def index():
    if request.method == "POST":
        name = request.form.get("name")
        message = request.form.get("message")
        with open("feedback.txt", "a") as f:
            f.write(f"{name}: {message}\n")
        return redirect(url_for("thankyou"))
    return render_template("index.html")


@app.route("/thankyou")
def thankyou():
    return "<h2>Thank you for your feedback!</h2><a href='/'>Back to Home</a>"


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
