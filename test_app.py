import os
import pytest
from app import app

@pytest.fixture
def client():
    app.config['TESTING'] = True
    with app.test_client() as client:
        yield client
    # Clean up any feedback written during tests
    if os.path.exists("feedback.txt"):
        os.remove("feedback.txt")

def test_get_index(client):
    response = client.get("/")
    assert response.status_code == 200
    assert b"<form" in response.data or b"Submit" in response.data

def test_post_feedback(client):
    data = {"name": "Khali", "message": "Great app!"}
    response = client.post("/", data=data, follow_redirects=False)
    assert response.status_code == 302
    assert response.location.endswith("/thankyou")

    # Check feedback.txt content
    with open("feedback.txt", "r") as f:
        contents = f.read()
    assert "Khali: Great app!" in contents

def test_thankyou_page(client):
    response = client.get("/thankyou")
    assert response.status_code == 200
    assert b"Thank you for your feedback" in response.data
