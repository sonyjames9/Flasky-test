# Flasky-test

## This is a testing to check the UI and API user registration, update and viewing of users on the flask app 

*https://github.com/sonyjames9/Flasky.git*

[Changes]
- Requirements installation had changed from the existing one, so had to update the python libs  
- Docker file modified for Windows Docker desktop launch
- Change in run.sh file to start the app

-----------------------------------------------------------------
*https://github.com/sonyjames9/Flasky-test.git*

#### This repo is supposed to be run on Py3.7, please feel free to use virutal env setup for this project
#### This repo was run windows command line

    
- Virtual env setup
  * python.exe -m virtualenv ./flask_env
  * flask_env\Scripts\pip3.7.exe install -r requirements.txt
  * flask_env\Scripts\activate.bat
  * Once virutal env is activated, the command line should look something like 
    * "(flask_env) E:\Flasky-test>"
    

- This repo has 2 tests
    * UI
      * reports are added in logs folder for reference
    * API

* UI - Run the UI tests
    * robot tests/ui/Login.robot
    * robot --timestampoutputs --log robot_log.html --outputdir logs --report NONE tests/ui/Login.robot
    * robot --timestampoutputs --log robot_log.html --outputdir logs --include smoke tests/ui/Login.robot


  ![alt text](https://github.com/sonyjames9/Flasky-test/blob/main/logs/sample_report.png)

* API - Run the API tests
    * flask_env/Scripts/pytest.exe path/flask_api_requests.py
    * flask_env/Scripts/pytest.exe tests/api/tests_api/test.py --html=logs/pytest_report.html

    ![alt text](https://github.com/sonyjames9/Flasky-test/blob/main/logs/pytest.png)


## Docker setup
-- This was build using windows, should work for linux as well; follow the below commands to build the image and run the command

* docker build . -t flask-test
* docker run --name flask-test --rm -it flask-test flask_env/bin/pytest tests/api/tests_api/test.py --html=./logs/pytest_report.html
  

