import json
import requests
from tests.api.config import *


def get_users():
  response = requests.get(users_url)
  return response


def get_token(username, password):
  response = requests.get(auth_url, auth=(username, password))
  return response


def return_token(username, password):
  return get_token(username, password).json()['token']


def get_specific_user(user):
  headers = {'Token': return_token(user, password)}
  url = users_url + '/' + user

  response = requests.get(url, headers=headers)
  return response


def update_users(user):
  url = users_url + '/' + user
  headers = {'Token': return_token(username, password)}
  response = requests.get(url, headers=headers, data=update_payload)
  return response


def add_user():
  headers = {'Content-Type': 'application/json'}
  response = requests.post(users_url, headers=headers, data=json.dumps(register_user_payload))
  return response


response = get_users()
# response = update_users(username)
# response = add_users()

# print(response.status_code)
# print(response.json())
# print(response.headers)
#
# token = return_token(username, password)
# print(token)
