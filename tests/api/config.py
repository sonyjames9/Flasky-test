url = 'http://localhost:8080/'
auth_url = url + "api/auth/token"
users_url = url + "api/users"

username = "test_user1"
password = "test_pass"

update_payload = {
  "firstname": "first1_1",
  "lastname": "last1_1",
  "phone": 123456789011
}

register_user_payload = {
  "username": "test_user10",
  "password": "test_pass",
  "firstname": "first",
  "lastname": "last",
  "phone": 1234567890
  }

new_user_payload = {
  "username": "test_user1",
  "password": "test_pass",
  "firstname": "first",
  "lastname": "last",
  "phone": 1234567890
}

new_user_payload2 = {
  "username": "test_user1",
  "password": "test_pass",
  "firstname": "first",
  "lastname": "last",
  "phone": 1234567890
}