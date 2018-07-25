*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${BROWSER}        Chrome
${DELAY}          0
${LOGIN URL}  http://www.facebook.com/login/
${WELCOME URL}  http://www.facebook.com/

${LOGIN PAGE TITLE}   Log in to Facebook | Facebook
${WELCOME PAGE TITLE}    Facebook

*** Keywords ***
Open Browser To Login Page
    Open Browser    ${LOGIN URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    ${LOGIN PAGE TITLE}

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    email    ${username}

Input Password
    [Arguments]    ${password}
    Input Text    pass    ${password}

Submit Credentials
    Click Button   loginbutton

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be    ${WELCOME PAGE TITLE}
