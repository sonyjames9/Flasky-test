from tests.api.request_functions.flask_api_requests import *
from tests.api.config import *


def test_add_user():
  response = add_user(new_user_payload)
  assert response.status_code == 201
  assert response.json()['status'] == 'SUCCESS'
  assert response.json()['message'] == 'Created'


def test_get_users():
  response = get_users()
  arr_users = response.json()['payload']
  assert response.status_code == 200
  assert 'test_user1234' in arr_users
  assert 'test_user1' in arr_users


def test_get_specific_users():
  response = get_specific_user(username)
  user_info = response.json()['payload']
  assert response.status_code == 200
  assert response.json()['message'] == 'retrieval succesful'
  assert response.json()['status'] == 'SUCCESS'
  assert 'first' in user_info['firstname']
  assert 'last' in user_info['lastname']
  assert '1234567890' in user_info['phone']


def test_get_token():
  response = get_token(username, password)
  assert response.status_code == 200
  assert response.json()['status'] == 'SUCCESS'
  token = response.json()['token']
  assert len(token) >= 50


def test_update_users():
  response = update_users(username)
  user_info = response.json()['payload']

  assert response.status_code == 200
  assert response.json()['message'] == 'retrieval succesful'
  assert response.json()['status'] == 'SUCCESS'
  assert 'first' in user_info['firstname']
  assert 'last' in user_info['lastname']
  assert '1234567890' in user_info['phone']


