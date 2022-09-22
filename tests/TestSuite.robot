*** Settings ***
Documentation       This is a basic test to open a browser to the Noona demo site and test if the login form works

Library             Selenium2Library
Library             Screenshot
Resource            keywords.resource
Resource            variables.resource


*** Variables ***
${URL}          https://demo.patient.noonatest.com/patient/#/login
${BROWSER}      chrome


*** Test Cases ***
Test Case 1
    Say Opening Noona

User can open page
    [Documentation]    As a user I can open the Noona demo page
    open browser    ${URL}    ${BROWSER}
    wait until page contains    Welcome to Noona

Input Invalid Email And Check If Button Is Disabled
    Input Text    id:email    invalidemail
    Element Should Be Disabled    //*[@id="email-and-password-next-button"]/button
    Take Screenshot
    sleep    1s

Input Valid Email With Wrong Password And Submit
    Input Text    id:email    wrong@email.com
    Input Password    id:pwd    password
    Submit Form

Check If Login Form Error Exists
    Wait Until Element Is Visible    id:login-form-error
    Take Screenshot
    sleep    2s
    Close Browser
