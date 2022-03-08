*** Settings ***
Library    PythonKeywords.py
Library    REST

*** Variables ***
${thing} =  Default

*** Keywords ***
Check Array Size
    GET  http://espoonkopsu.fi:8022/data/things/
    ${things} =  Array  $.things
    return array length  ${things}

Set Input Element
    ${thing} =  generate thing
    Set Global Variable  ${generated_thing}  ${thing}
    Fill Text  id=thing  ${generated_thing}
    ${text} =  Get Text  id=thing
    Log To Console  ${text}

Answer Questions
    Click  id=answer_radio_no_1
    Click  id=answer_radio_yes_2

Submit Answer
    Click  .btn-primary

Check Answer
    GET  http://espoonkopsu.fi:8022/data/things/
    ${things} =  Array  $.things
    Integer  $.things[*].id
    find answer  ${things}  ${generated_thing}





