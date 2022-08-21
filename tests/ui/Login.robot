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
${user_info}    xpath://*[@id='username']
${user_logged}  xpath:/html/body/nav/ul/li[1]/span
${user}         test_user23

*** Test Cases ***
Open Demo app
    [Tags]  smoke   sanity  regression
    Open Browser on Demo app

Navigate to Register Page
    [Tags]  smoke   sanity
    Navigate Browser to Register page

Register a user
    [Tags]  smoke   regression
    Enter the registration details and submit

Login with a username and password
    [Tags]  smoke
    Enter the credentials and login

Validate the registered user
    [Tags]  smoke   regression
    Validate the user

Close Demo Page
    [Tags]  smoke   regression
    Close Browser

*** Keywords ***
Open Browser on Demo app
    Open Browser    ${URL}      ${BROWSER}
    Title Should Be    index page - Demo App

Navigate Browser to Register page
    Go To           ${URL}register
    Title Should Be    Register - Demo App

Enter the registration details and submit
    Set Selenium Speed      1
    Enter Username          ${user}
    Enter Password          test_pass
    Enter Firstname         first
    Enter Lastname          last
    Enter Phone             1234567890
    Click Register
    Title Should Be         Log In - Demo App

Enter the credentials and login
    Go To                   ${URL}login
    Enter Username          ${user}
    Enter Password          test_pass
    Click Login
    Title Should Be         User Information - Demo App
    Log             "test"
    Log             "test"


Validate the user
    Go To               ${URL}user
    ${uname_info}       get text    ${user_info}
    ${uname_logged}     get text    ${user_logged}
    Log to console      ${uname_info}
    Should Be True      '${uname_info}'=='${user}'
    Should Be True      '${uname_logged}'=='${user}'


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

