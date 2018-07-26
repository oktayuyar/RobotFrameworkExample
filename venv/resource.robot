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
${LOGIN URL}  http://www.amazon.com/login/
${WELCOME URL}  http://www.amazon.com/

${LOGIN PAGE TITLE}   Amazon Sign In
${WELCOME PAGE TITLE}    Amazon.com: Online Shopping for Electronics, Apparel, Computers, Books, DVDs & more



*** Keywords ***
Open Browser To Login Page
    Open Browser    ${WELCOME URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Click Link    nav-link-accountList
    Login Page Should Be Open

Login Page Should Be Open
    Title Should Be    ${LOGIN PAGE TITLE}

Go To Login Page
    Click Link    nav-link-accountList
    Login Page Should Be Open

Input Username
    [Arguments]    ${username}
    Input Text    email    ${username}

Click Continue Button
    Click Button   continue

Input Password
    [Arguments]    ${password}
    Input Text    password    ${password}

Submit Credentials
    Click Button   signInSubmit

Welcome Page Should Be Open
    Title Should Be    ${WELCOME PAGE TITLE}
