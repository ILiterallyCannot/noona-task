*** Settings ***
Documentation       This is a basic test to open a browser to the Noona demo site and test if the login form works

Library             Selenium2Library
Library             Collections
Library             RequestsLibrary
Library             Screenshot
Library             OperatingSystem
Library             Builtin
Resource            keywords.resource
Resource            variables.resource


*** Variables ***
${URL}          https://demo.patient.noonatest.com/patient/#/login
${BROWSER}      chrome


*** Test Cases ***
Test Case 1
    Say Opening Noona

Open Noona Page
    [Documentation]    As a user I can open the Noona demo page
    open browser    ${URL}    ${BROWSER}
    wait until page contains    Welcome to Noona

Check Noona Response
    Create Session    noona    https://demo.patient.noonatest.com/patient/#/login
    ${resp_noona}=    GET On Session    noona    /    expected_status=200
    Should Be Equal As Strings    ${resp_noona.reason}    OK

Input Invalid Email And Check If Button Is Disabled
    Input Text    id:email    invalidemail
    Element Should Be Disabled    //*[@id="email-and-password-next-button"]/button
    Take Screenshot
    sleep    1s

Input Valid Email With Wrong Password And Submit
    ${json}=    Get file    ./tests/vault.json    # TODO, should be hidden!
    ${object}=    Evaluate    json.loads('''${json}''')    json
    Input Text    id:email    ${object["credentials"]["email"]}
    Input Password    id:pwd    ${object["credentials"]["password"]}
    Submit Form

Check If Login Form Error Exists
    Wait Until Element Is Visible    id:login-form-error
    Take Screenshot
    sleep    2s
    Close Browser
