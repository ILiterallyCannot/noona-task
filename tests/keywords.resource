*** Settings ***
Library     PythonKeywords.py


*** Keywords ***
Say Opening Noona
    Log To Console    Opening Noona

Login
    [Arguments]    ${username}    ${password}
    log    the password is ${password}. If you are seeing this message in logs, the settings are wrong.
