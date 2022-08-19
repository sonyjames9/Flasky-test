*** Settings ***
Documentation     Test suite for valid login on Demo app.
...
...               Keywords are imported from the resource file
Resource          keywords.resource
Library           SeleniumLibrary

# Suite Setup       Open Browser on Demo app
# Suite Teardown    Close Browser

*** Variables ***
${URL}          http://localhost:8080/
${BROWSER}      Firefox
${username}     id:username
${password}     id:password
${firstname}    id:firstname
${lastname}     id:lastname
${phone}        id:phone
${register}     css:input[type=submit]:nth-child(11)
${submit}       Register
${login}        Log In


*** Test Cases ***
Open Demo app
    Open Browser on Demo app

Navigate to Register Page
    Navigate Browser to Register page

Register a user
    Enter the registration details and submit

Login with a username and password
    Enter the credentials and login

Validate the registered user
    Validate the user

Close Demo Page
    Close Browser

*** Keywords ***
Open Browser on Demo app
    Open Browser    ${URL}      ${BROWSER}
    Title Should Be    index page - Demo App
    Set Selenium Speed  2

Navigate Browser to Register page
    Go To           ${URL}register
    Title Should Be    Register - Demo App

Enter the registration details and submit
    Set Selenium Speed      0
    Enter Username          test_user1
    Enter Password          test_pass
    Enter Firstname         first
    Enter Lastname          last
    Enter Phone             1234567890
    Click Register
    Title Should Be         Log In - Demo App

Enter the credentials and login
    Go To                   ${URL}login
    Enter Username          test_user1
    Enter Password          test_pass
    Click Login
    Title Should Be         User Information - Demo App
    Log             "test"
    Log             "test"


Validate the user
    Go To                   ${URL}user
    Set Selenium Speed      2
    ${uname}   =    Get Text        ${username}
    ${uname.strip()}
    Log             ${uname}
    Should Be True ${uname} == 'test_user1'


Enter Username
    [Arguments]    ${username}
    Input Text      username    ${username}

Enter Password
    [Arguments]    ${password}
    Input Text      password    ${password}

Enter Firstname
    [Arguments]    ${firstname}
    Input Text      firstname    ${firstname}

Enter Lastname
    [Arguments]    ${lastname}
    Input Text      lastname    ${lastname}

Enter Phone
    [Arguments]    ${phone}
    Input Text      phone    ${phone}

Click Register
    Click Button    ${submit}

Click Login
    Click Button    ${login}

Close Demo Page
    Close Browser 

